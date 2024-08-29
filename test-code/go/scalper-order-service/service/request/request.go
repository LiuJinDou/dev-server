package request

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

// APIClient holds the base URL and client for making API requests
type APIClient struct {
	BaseURL string
	Client  *http.Client
}

// NewAPIClient creates a new APIClient
func NewAPIClient(baseURL string) *APIClient {
	return &APIClient{
		BaseURL: baseURL,
		Client:  &http.Client{},
	}
}

// Get sends a GET request to the specified endpoint
func (api *APIClient) Get(endpoint string) (result interface{}, err error) {
	resp, err := api.Client.Get(api.BaseURL + endpoint)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("GET request failed with status: %s", resp.Status)
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}

	if err := json.Unmarshal(body, &result); err != nil {
		return nil, err
	}
	return
}

// Post sends a POST request to the specified endpoint with the given data
func (api *APIClient) Post(endpoint string, data interface{}) (body []byte, err error) {
	jsonData, err := json.Marshal(data)
	if err != nil {
		return nil, err
	}

	resp, err := api.Client.Post(api.BaseURL+endpoint, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("POST request failed with status: %s", resp.Status)
	}

	body, err = ioutil.ReadAll(resp.Body)
	return
}

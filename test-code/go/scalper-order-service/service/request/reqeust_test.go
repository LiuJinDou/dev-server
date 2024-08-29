package request

import (
	"bytes"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"
)

// Mock server to simulate API responses
func setupMockServer() *httptest.Server {
	handler := http.NewServeMux()

	handler.HandleFunc("/get-data", func(w http.ResponseWriter, r *http.Request) {
		response := map[string]interface{}{
			"message": "Mocked GET response",
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(response)
	})

	handler.HandleFunc("/post-data", func(w http.ResponseWriter, r *http.Request) {
		var requestData map[string]interface{}
		json.NewDecoder(r.Body).Decode(&requestData)

		response := map[string]interface{}{
			"received": requestData,
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(response)
	})

	return httptest.NewServer(handler)
}

func TestGet(t *testing.T) {
	server := setupMockServer()
	defer server.Close()

	apiClient := NewAPIClient(server.URL)
	data, err := apiClient.Get("/get-data")

	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	expected := map[string]interface{}{
		"message": "Mocked GET response",
	}

	if !equal(data, expected) {
		t.Errorf("expected %v, got %v", expected, data)
	}
}

func TestPost(t *testing.T) {
	server := setupMockServer()
	defer server.Close()

	apiClient := NewAPIClient(server.URL)
	postData := map[string]interface{}{
		"key": "value",
	}
	response, err := apiClient.Post("/post-data", postData)

	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	expected := map[string]interface{}{
		"received": postData,
	}

	if !equal(response, expected) {
		t.Errorf("expected %v, got %v", expected, response)
	}
}

// Helper function to compare two maps
func equal(a, b map[string]interface{}) bool {
	aBytes, _ := json.Marshal(a)
	bBytes, _ := json.Marshal(b)
	return bytes.Equal(aBytes, bBytes)
}

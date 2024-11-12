package main

type User struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

func GetUserInfo() *User {
	return &User{
		Username: "test",
		Password: "123456",
	}
}

func main() {
	_ = GetUserInfo()
}

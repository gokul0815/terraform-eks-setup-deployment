package main

import (
	config "gin-api/config"
)

func main() {
	r := config.SetupRouter()
	// Listen and Server in 0.0.0.0:8080
	r.Run(":8080")
}

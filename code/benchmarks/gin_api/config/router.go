package config

import (
	"gin-api/app/controllers"

	"github.com/gin-gonic/gin"
)

func SetupRouter() *gin.Engine {
	// Disable Console Color
	// gin.DisableConsoleColor()
	r := gin.Default()

	// Ping test
	r.GET("/ping", controllers.Ping)
	r.GET("/api/benchmarks", controllers.BenchmarkIndex)

	return r
}

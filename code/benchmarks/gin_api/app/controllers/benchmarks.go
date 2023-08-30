package controllers

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

func BenchmarkIndex(c *gin.Context) {
	time.Sleep(20 * time.Microsecond)
	c.JSON(http.StatusOK, gin.H{
		"message": "it works!",
	})
}

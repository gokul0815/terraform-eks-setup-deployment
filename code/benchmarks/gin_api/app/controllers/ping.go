package controllers

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

var Ping = func(c *gin.Context) {
	c.String(http.StatusOK, "pong!")
}

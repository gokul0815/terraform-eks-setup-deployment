# About

This project intend to derive some benchmarks by simulating some compute, memory and io(sleep).

We'll use apache bench to do benchmarking of follwing.

* elixir phoenix
* Ruby on Rails
* ExpressJS node
* gin golang

## starting rails app

after installing the dependencies, go in rails_api directory and run

    rails s

## starting express app

after installing the dependencies, go in express_api directory and run

    npm start

## starting phoenix app

after installing the dependencies, go in rails_api directory and run

    mix phx.server

## starting gin app

after installing the dependencies, go in gin_api directory and run

    go run .

# benchmarking

Once the above servers are running, the same can be benchmarked with follwing commands respectively.

    ab -n 1000 -c 50 http://127.0.0.1:3000/api/benchmarks
    ab -n 1000 -c 50 http://127.0.0.1:4001/api/benchmarks
    ab -n 1000 -c 50 http://127.0.0.1:4000/api/benchmarks
    ab -n 1000 -c 50 http://127.0.0.1:8080/api/benchmarks

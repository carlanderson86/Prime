# README

Test Application to generate a N+1 x N+1 grid of prime numbers.

Prerequisites
* Ruby 2.4
* Rails 5.1

How to Run
* In terminal, navigate to the project directory
* Type: rails s Puma
* Navigate to http://127.0.0.1:3000 in your web browser.

What I am please with
* Simplicity
* Task is jobbed so it can be expanded and use ActionCables at a later date

What I would have done with more time.
* Make the task asynchronous so it doesn't lock up the server.
* Looked into a better filter on the prime to weed out primes divisible by two and three at least.
* Better interface
* Tabbed results so multiples can be run at the same time


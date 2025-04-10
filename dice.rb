require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
  erb (:elephant)
end

get("/dice/2/6") do
  @die = rand(1..6)
  second_die = rand(1..6)
  sum = @die + second_die

  @outcome = "You rolled a #{@die} and a #{second_die} for a total of #{sum}."

  erb(:two_six)
end

get("/dice/2/10") do
  first_die = rand (1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_ten)
end

get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)
    @rolls.push(die)
  end

  erb(:hundred_six)
end

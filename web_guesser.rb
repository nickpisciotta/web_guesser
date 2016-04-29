require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(101)

get '/' do
  guess = params["guess"].to_i
  response = check_guess(guess)
  erb :index, :locals => {:number => NUMBER, :reponse => response}
end

def check_guess(guess)
  case
  when guess > (NUMBER + 5)
    "Way too high"
  when guess < (NUMBER - 5)
    "Way too low"
  when guess > NUMBER
    "Too High!"
  when guess < NUMBER
    "Too Low!"
  when guess = NUMBER
    "You are correct! The secret number is #{NUMBER}"
  end
end

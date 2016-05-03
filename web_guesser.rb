require 'sinatra'
require 'sinatra/reloader'

@@number = rand(101)
@@guesses = 5

get '/' do
  guess = params["guess"].to_i
  cheat = params["cheat"]
  response = check_guess(guess)
  if cheat == "true"
    response = "The secret code is #{@@number}"
  end
  erb :index, :locals => {:number => @@number, :reponse => response}
end

def check_guess(guess)
  @@guesses -= 1
  if @@guesses == 0
     @@number = rand(101)
     @guesses = 5
     "You've lost, choose a new number"
  else
    case
    when guess > (@@number + 5)
      "Way too high"
    when guess < (@@number - 5)
      "Way too low"
    when guess > @@number
      "Too High!"
    when guess < @@number
      "Too Low!"
    when guess = @@number
      message = "You are correct! The secret number is #{@@number}"
      @@number = rand(101)
      @@guesses = 5
      message
    end
  end
end

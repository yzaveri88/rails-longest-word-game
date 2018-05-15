require 'open-uri'

class GamesController < ApplicationController
  def new
    letter = ["A".."Z"].to_a
    @letters = (0...10).map {letter [rand(26)]}
  end

  def score
  url = "https://wagon-dictionary.herokuapp.com/#{params[:guess]}"
  word_check = open(url).read
  json = JSON.parse(word_check)
  if json['found']
    @found_message = "This word was found in the dictionary"
    params[:guess].upcase.chars.each do |character|
    if included?(:guess.upcase, grid)
      if english_word?(attempt)
        score = compute_score(attempt, time)
        [score, "well done"]
      else
        [0, "not an english word"]
      end
    else
    [0, "not in the grid"]
    end
  end
end

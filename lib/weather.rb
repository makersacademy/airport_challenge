class Weather

  def stormy?
    number = rand(20)
    number.zero? ## just to make rubocop happy I used numbner == 0 
  end

end

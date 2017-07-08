class Weather
  def stormy?
    to_return = (rand(100) % 13).zero? ? true : false
    p to_return
    to_return
  end
end

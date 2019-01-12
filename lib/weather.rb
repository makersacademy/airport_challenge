class Weather

  def stormy?
    weather = ['sunny', 'sunny', 'sunny', 'sunny', 'stormy']
    weather[rand(0..4)] == 'stormy'
  end

end

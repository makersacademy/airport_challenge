class Weather
  def condition
    # gives a 20% chance for bad weather
    rand(10) < 8 ? 'clear' : 'stormy'
  end
end

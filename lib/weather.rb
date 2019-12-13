module Weather
  # This returns a random number between 1 and 10 and if less then 8,
  # it returns true for good weather otherwise false for bad weather

  def good_weather?
    rand(1..10) < 8 ? true : false
  end

end

class DummyWeather
  include Weather
end

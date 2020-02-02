require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

class Test

  def test_one_with_random_weather
    # User story 1
    # returns "plane 1" 
    # or error that plane cannot land due to storm
    airport = Airport.new(Weather.new)
    airport.plane_land("plane1")
  end

  def test_one_with_good_weather
    # User story 1
    # returns "plane 1" 
    airport = Airport.new(weather)
    airport.plane_land("plane1")
  end

  def test_one_with_stormy_weather
    # User story 1
    # returns error that plane cannot land due to storm
    airport = Airport.new(Weather.new)
    airport.plane_land("plane1")
  end

  def test_two_with_random_weather
    # User story 2
    # returns blank array of planes or 
    # erros that plane cannot land/take off due to storm
    airport = Airport.new(Weather.new)
    airport.plane_land("plane1")
    airport.plane_take_off("plane1")
  end

  def test_two_b
    # User story 2
    # returns array of planes at airport, not including take off plane
    airport = Airport.new
    airport.plane_land("plane1")
    airport.plane_land("plane2")
    airport.plane_land("plane3")
    airport.plane_take_off("plane2")
  end

  def test_three
    # User story 3
    # should over capacity throw error
    airport = Airport.new
    airport.capacity()
    21.times do
      airport.plane_land("plane1")
    end
  end

  def test_four
    # User story 4
    # should throw over capacity errror
    airport = Airport.new
    airport.capacity(7)
    8.times do
      airport.plane_land("plane1")
    end
  end

  def test_five
    # User story 5
    # should see occasional errors in landing due to Storm
    airport = Airport.new
    airport.plane_land("plane1")
  end

  def test_six
    # User story 6
    # should see occasional errors in take_off due to Storm
    # careful with take off, can remove plane with same name
    airport = Airport.new
    10.times do
      airport.plane_land("plane1")
      airport.plane_take_off("plane1")
    end
  end
end
test = Test.new
# test.test_one_with_random_weather
test.test_one_with_good_weather
# test.test_one_with_stormy_weather
# test.test_two
# test.test_two_b
# test.test_three
# test.test_four
# test.test_five

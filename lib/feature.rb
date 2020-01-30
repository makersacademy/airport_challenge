require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

class Test

  def test_one
    # User story 1
    # returns "plane 1"
    airport = Airport.new
    airport.plane_land("plane1")
  end

  def test_two
    # User story 2
    # returns blank array of planes
    airport = Airport.new
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
    #should over capacity throw error
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

end
test = Test.new
# test.test_one
# test.test_two
p test.test_two_b
# test.test_three
# test.test_four

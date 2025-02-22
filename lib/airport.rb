require_relative '../lib/plane'
require_relative '../lib/weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY, airport = "Heathrow")
    @capacity = capacity
    @planes_available = []
    @airport = airport
    @skytraffic = []
  end

  def land_plane(plane)
    plane_already_landed?(plane)
    weather_check(weather())
    fail 'Plane storage over capacity' if full?
    @planes_available << { plane: plane, airport: airport }
  end 

  def takeoff_plane
    weather_check(weather())
    fail 'No planes available' if empty?
    airport_error
    skytraffic_checker
    @skytraffic << @planes_available.last
    @planes_available.pop 
  end 

  private

  attr_reader :planes_available, :skytraffic
  attr_accessor :airport

  def full?
    @planes_available.count >= @capacity
  end 

  def empty?
    @planes_available.count.zero?
  end 

  def weather_check(weather_check)
    fail "Not possible due to weather conditions: #{weather_check}" if weather_check == "STORMY";
  end 

  def weather
    weather_check = Weather.new
    weather_check.weather
  end 

  def airport_error
    fail "This plane is not stationed at this Airport" if airport_check
  end 

  def airport_check
    checker = @planes_available.last
    checker[:airport] != @airport
  end 

  def plane_already_landed?(plane)
    @planes_available.each do |airport_entry| 
      fail "Plane has already landed" if airport_entry[:plane] == plane 
    end 
  end 

  def skytraffic_checker
    last_plane = planes_available.last
    @skytraffic.each do |skytraffic_entry| 
      fail "Plane is already in the air" if skytraffic_entry[:plane] == last_plane[:plane] 
    end 
  end 
  
end

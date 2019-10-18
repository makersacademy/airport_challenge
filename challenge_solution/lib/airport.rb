# require "./lib/aeroplane"

class Airport
  attr_accessor :landed
  attr_accessor :weather

  def initialize
    @landed = []
    @weather = rand(10)
  end

  def land(aeroplane)
    @landed << aeroplane
  end

  def takeoff(aeroplane)
    if @weather == 1
      return "Stormy conditions, #{aeroplane} cannot take off"
    else
      @landed.delete(aeroplane)
      if @landed.include?(aeroplane) == false
        aeroplane.capitalize![0]
        puts "#{aeroplane} has taken off"
      end
    end
  end
end

# airport = Airport.new
# airport.weather = 1
# puts airport.weather
# airport.land("aeroplane")
# airport.takeoff("aeroplane")
# puts airport.weather

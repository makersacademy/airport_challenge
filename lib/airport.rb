require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 2

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY )
      @planes = []
      @landed_planes = []
      @weather = weather
      @capacity = capacity
  end

  def weather_report
    weather = rand(1..10)
    if weather <= 4
      "stormy"
      else
      "sunny"
      end
  end

  def land(plane)
    fail "Landing denied, Airport is full" if full?
    fail "Landing denied, weather report stormy" if weather_report == "stormy"
    puts "Fasten seatbelts, plane landing..."
    planes << plane
  end

  def confirm_landing(plane)
    planes.each do |plane|
      landed_planes << plane	
    end
    puts "Plane has landed! Docked at bridge for passengers."
    landed_planes
    end	
    
  def takeoff(landed_plane)
    fail "the flight has already departed" if empty?
    fail "Take off denied, weather report stormy" if stormy? 
    puts "Fasten seatbelts, plane taking off..."
    landed_planes.pop
  end

  def plane_status
    puts "Number of Planes: #{planes}, #{planes.count} total."
    puts "Planes on ground: #{landed_planes}, #{landed_planes.count} total."
  end

  private 

    attr_reader :planes, :landed_planes, :weather

    def empty?
      landed_planes.empty?
    end

    def full?
      planes.length >= capacity
    end

    def stormy?
      weather_report == "stormy"
    end
end
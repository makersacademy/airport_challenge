require_relative 'plane'

class Airport

  attr_accessor :capacity
  attr_reader :hangar, :weather

  DEFAULTCAPACITY = 10

  def initialize(capacity = DEFAULTCAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = "Sunny"
  end

  def land(plane)
    checkweather
    fail "Airport is full" if full?
    fail "Plane cannot land due to stormy weather conditions" if @weather == "Stormy"
    fail "Plane cannot land if already landed" if @hangar.include?(plane)

    @hangar << plane
  end

  def take_off(plane)
    checkweather
    fail "Plane cannot take off due to stormy weather conditions" if @weather == "Stormy"
    fail "Plane is not in this airport" unless @hangar.include?(plane)

    @hangar.delete(plane)
  end

  def override_capacity(number)
    @capacity = number
  end

  private

  def full?
    @hangar.length >= @capacity
  end

  def checkweather
    n = rand(1..10)
    n == 10 ? @weather = "Stormy" : @weather = "Sunny"
  end

end

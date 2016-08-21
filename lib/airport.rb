require_relative './plane.rb'
require_relative './weather.rb'

class Airport

  attr_reader :weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Planes cannot land in stormy weather" if bad_weather?
    fail "Planes cannot land when airport is full" if full?
    fail "This plane is already at an airport" if plane.grounded == true
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    fail "Planes cannot take off in stormy weather" if bad_weather?
    fail "This plane is already flying" if plane.grounded == false
    fail "This plane is not at this airport" unless @planes.include? plane
    plane.taken_off
    @planes.delete(plane)
  end

  private

  attr_reader :planes ,  :weather

    def full?
      planes.count >= @capacity
    end

    def bad_weather?
      @weather.stormy?
    end

end

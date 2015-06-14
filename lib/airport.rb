require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  attr_accessor :capacity
  attr_reader :weather

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @weather = :fine
  end

  def instruct_plane_to_take_off plane
    fail "Cannot allow take off due to stormy weather" if stormy?
    plane.takeoff
    release_plane(plane)
  end

  def instruct_plane_to_land plane
    fail "Cannot allow land request due to stormy weather" if stormy?
    plane.land
    receive_plane plane
  end

  def release_plane plane
    planes.delete(plane)
  end

  def receive_plane plane
    fail "Airport Full" if full?
    planes << plane
  end

  def empty?
    planes.empty?
  end

  def full?
    planes.count >= capacity
  end

  def check_weather
    if rand(100) >= 80
      @weather = :stormy
    else
      @weather = :fine
    end
  end

  def stormy?
    weather == :stormy
  end

  private

  attr_accessor :planes

end

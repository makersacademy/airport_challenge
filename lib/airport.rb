require_relative 'plane'

class Airport

  attr_reader :planes, :capacity, :weather

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def request_landing plane
    weather_conditions_check
    capacity_check
    landing_authorisation plane
    receive_plane plane
    landing_confirmation plane
  end

  def request_take_off plane
    weather_conditions_check
    correct_airport_check plane
    take_off_authorisation plane
    release_plane plane
  end

  def weather
    [:sunny, :stormy].sample
  end

  private

  def capacity_check
    raise "Airport is full" if full?
  end

  def full?
    @planes.count >= @capacity
  end

  def landing_authorisation plane
    plane.land
  end

  def receive_plane plane
    @planes << plane
  end

  def landing_confirmation plane
    "plane #{plane} has landed at #{self}"
  end

  def weather_conditions_check
    raise "weather unsafe" if weather == :stormy
  end

  def correct_airport_check plane
    raise "not in airport" unless plane_at_air_port_check plane
  end

  def plane_at_air_port_check plane
    return true if @planes.include?(plane)
  end

  def take_off_authorisation plane
    plane.take_off
  end

  def release_plane plane
    @planes.delete plane
  end
end



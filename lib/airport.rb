require_relative 'weather'

class Airport
  def initialize weather
    @planes = []
    @weather = weather
  end

  def land plane
    fail 'Weather too stormy!' if stormy?
    fail 'That is not a plane!' if not_a? plane
    plane.land self
    planes << plane
    self
  end

  def take_off plane
    fail 'Weather too stormy!' if stormy?
    fail 'Plane not found!' unless contain? plane
    plane.take_off 
    planes.delete plane
    self
  end

  def contain? plane
    planes.include? plane
  end

  def stormy?
    weather.stormy?
  end

  private

  attr_reader :planes, :weather

  def not_a? plane
    plane.class.to_s != 'Plane'
  end
end

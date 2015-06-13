require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def take_off
    Plane.new
  end

  def land plane
    planes << plane
  end

  def traffic_control
    fail 'Plane can not land, the airport is full.' if @planes
    @planes = plane
  end

  def empty?
    planes.empty?
  end

  private

  attr_reader :planes

end

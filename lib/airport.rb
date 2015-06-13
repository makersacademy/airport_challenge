require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def take_off plane
    planes.pop
  end

  def landing plane
    planes << plane
  end

  def traffic_control
    raise 'Plane can not land, the airport is full.'
  end

  def empty?
    planes.empty?
  end

  private

  attr_reader :planes

end

require_relative 'plane'
class Airport
attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    @planes.empty? ? @planes << plane : raise('Airport is full!')
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def confirm_take_off(plane)
    if !@planes.include? plane
      'Plane has left the airport'
    else
      raise 'Plane has not taken off.'
    end
  end
end
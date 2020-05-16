require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def landing(plane)
    @planes.push(plane)
  end

  def depart(plane)
    @planes.delete(plane)
    plane_left_notification(plane)
  end

private

  def plane_left_notification(plane)
    puts "#{plane} has left the airport"
  end

end

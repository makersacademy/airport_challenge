require_relative 'plane'

class Airport

  attr_reader :planes

  def landing(plane)
    @planes = plane
  end

  def depart(plane)
    @planes = nil
    plane_left_notification(plane)
  end

private

  def plane_left_notification(plane)
    puts "#{plane} has left the airport"
  end

end

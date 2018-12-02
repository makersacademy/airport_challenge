require './lib/weather'

class Airport < Weather

  attr_reader :plane, :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    raise "It is too stormy to land" unless stormy == false
    @hangar << plane
  end

  def take_off
    raise "It is too stormy to fly" unless stormy == false
    departed_plane = @hangar.pop
    puts "#{departed_plane} has left the airport"
  end

end

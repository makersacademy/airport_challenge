class Airport

  attr_reader :plane, :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off
    departed_plane = @hangar.pop
    puts "#{departed_plane} has left the airport"
  end

end

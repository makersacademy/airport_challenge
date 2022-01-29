require './lib/plane.rb'

class AirPort

attr_reader :hanger

  def initialize
    @hanger = []
  end

  def land(plane)
    if plane.flying == true
       plane.landed_plane
       @hanger << (plane)
    else
       puts "This plane has already landed!"
    end
  end

  def take_off(plane)
    if @hanger.include?(plane)
      plane.starts_flying
      @hanger.delete(plane)
    else
      puts "This plane is not at this airport"
    end
  end

end

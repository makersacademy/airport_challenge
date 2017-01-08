require_relative 'weather'

class Plane
  attr_accessor :landed, :storm

  def land
    # raise "Too stormy to land" unless @storm == false
    @landed = true
    "Plane has succesfully has landed"
  end

  def take_off
    @landed = false
    "Plane has succesfully has taken off"
  end

end

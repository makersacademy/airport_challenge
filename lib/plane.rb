class Plane
  attr_reader :flying, :stationary

  def initialize
    @flying = ""
    @stationary = ""
  end

  def take_off(plane = Plane.new)
    raise "This plane (#{plane}) has already taken off" if @flying == true

    @flying = true
    @stationary = false
    "#{plane} has taken off"
  end

  def land(plane)
    raise "This plane (#{plane}) has already landed" if @stationary == true

    @stationary = true
    @flying = false
    "#{plane} has landed"
  end

  def confirm_status(plane)
    "plane is flying"
  end
end

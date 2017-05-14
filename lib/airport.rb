class Airport

  attr_reader :plane

  def initialize
    @plane = []
  end

  def land_plane(plane)
    @plane << plane
    #"Plane landing confirmed!"
  end

  def take_off(plane)
    fail "This plane is not at the airport!" if empty?
    #refactor below here??
    if @plane.include? plane
    @plane.pop
    else
    fail "This plane is not at the airport!"
  end
  end

  def empty?
    @plane.count == 0
  end


end

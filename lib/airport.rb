class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end


  def land_plane(plane)
    fail "Hangar Full!!!" if @hangar.size >= 1
    @hangar << plane
  end


  def take_off
    fail "No planes on the ground!" if @hangar.size < 1
    @hangar.pop
  end

end

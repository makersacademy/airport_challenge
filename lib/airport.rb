class Airport

  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 1

  def initialize
    @hangar = []
    @capacity = DEFAULT_CAPACITY
  end


  def land_plane(plane)
    fail "Hangar Full!!!" if full?
    @hangar << plane
  end


  def take_off
    fail "No planes on the ground!" if empty?
    @hangar.pop
  end



  private

  def full?
    @hangar.size >= @capacity
  end

  def empty?
    @hangar.empty?
  end


end

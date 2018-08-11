class Airport

  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity

  end


  def land_plane(plane)
    fail "Hangar Full!!!" if full?
    @hangar << plane
  end


  def take_off(plane)
    fail "No planes on the ground!" if empty?
    @hangar.delete(plane)
  end





  private

  def full?
    @hangar.size >= @capacity
  end

  def empty?
    @hangar.empty?
  end



end

class Airport

  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end


  def land_plane(plane)
    fail "Hangar Full!!!" if full?

    @hangar << plane
  end


  def take_off
    fail "No planes on the ground!" if empty?
    @hangar.pop
    #@hanger.pop has left the airport - we need to confirm it is no longer in the airport
  end

  def stormy?

  end



  private

  def full?
    @hangar.size >= @capacity
  end

  def empty?
    @hangar.empty?
  end



end

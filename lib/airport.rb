class Airport

  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Hangar Full!!!" if full?
    fail "Cannot land due to bad weather!" if stormy?
    @hangar << plane
  end

  def take_off(plane)
    fail "No planes on the ground!" if empty?
    fail "Cannot take off due to bad weather!" if stormy?
    @hangar.delete(plane)
  end

  private

  # think about adding a def at_airport?(plane) method @hangar.include?(plane)
  # think about making weather its own class/or module?? and having the airport use it as an attribute



  def full?
    @hangar.size >= @capacity
  end

  def empty?
    @hangar.empty?
  end

  def stormy?
    rand(1..7) == 6
  end

end

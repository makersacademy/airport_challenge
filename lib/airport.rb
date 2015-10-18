class Airport
  attr_accessor :capacity
  attr_reader :hangar
  def initialize
    @capacity = 30
    @hangar = []
  end

  def land(plane)
    raise "Unable to land plane: max capacity has been reached." if @hangar.length >= @capacity
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete_if{|plane_in_hangar| plane_in_hangar == plane}
    plane
  end

end
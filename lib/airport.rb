class Airport
  attr_reader :hangar
  Capacity = 5

  def initialize
    @hangar = []
  end

  def land(plane)
    full?
    @hangar.push(plane)
  end

  def take_off(plane)

    @hangar.delete(plane)
  end

  def view_hangar
    @hangar
  end

  def full?
    if @hangar.count >= Capacity
      raise 'Airport is full' 
    end
  end

end

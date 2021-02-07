class Airport
  attr_reader :hangar

  def initialize(capacity = 5)
    @hangar = []
    @capacity = capacity
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
    if @hangar.count >= @capacity
      raise 'Airport is full' 
    end
  end

end

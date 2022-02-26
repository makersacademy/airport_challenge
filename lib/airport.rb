class Airport
  
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    if @hangar.length == 1
      raise "hangar is full"
    else
    @hangar << plane
    end
  end

  def take_off
    @hangar.pop
  end
end

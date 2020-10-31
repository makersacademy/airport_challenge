class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)

    raise "Airport at Capacity!" if @hangar.length >= 20

    @hangar << plane

  end

  def take_off(plane)
    hangar.delete(plane)
  end

  def hangar_count
    hangar.count
  end

end

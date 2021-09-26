class AirportLand

  def initialize(custom_capacity = 2)
    @hangar = Array.new()
    @capacity = custom_capacity
  end

  attr_reader :hangar, :capacity

  def land_plane(plane)
    rnd_no = rand(3)
    if @hangar.length < @capacity && rnd_no == 2
      @hangar.push(plane)
    end
  end

  def take_off_plane
    rnd_no = rand(3)
    if rnd_no == 2
      @hangar.pop()
      return @hangar
    end
  end

end

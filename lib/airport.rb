class Airport

  attr_accessor :capacity, :weather

  def initialize(capacity = 2)
    @parked_planes = []
    @capacity = capacity
    @weather = "sunny"
  end

  def land(plane)
    @weather = storm_brewing
    if @weather == "stormy"
      fail 'Cannot land in stormy weather'
    elsif @parked_planes.length >= @capacity
      fail 'The airport is full'
    else
      plane::status = "landed"
      @parked_planes << plane
    end
  end

  def take_off(plane = @parked_planes.first)
    @weather = storm_brewing
    if @weather == "stormy"
      fail 'Cannot take off in stormy weather'
    elsif @parked_planes.empty?
      fail 'Airport is empty'
    else
      plane::status = "flying"
      @parked_planes.delete(plane)
    end
  end

  def storm_brewing
    if rand(2) == 1
      'stormy'
    else
      'sunny'
    end
  end

end

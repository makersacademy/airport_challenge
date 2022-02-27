class Airport
  attr_reader :planes, :capacity
  def initialize(capacity=1)
    @planes = []
    @capacity = capacity
  end

  def receive_plane(plane)
    if @planes.length >= @capacity
      raise Exception.new
    else
      if stormy?
        return "it's too stormy, can't land!"
      else
        @planes << plane
      end
    end
  end

  def take_off_plane(plane)
    if @planes.empty?
      raise Exception.new
    end

    if stormy?
      return "It's too stormy, can't takeoff!"
    else
      plane_to_be_returned = plane
      @planes.delete(plane)
      return plane_to_be_returned
    end
  end

  def stormy?
    weather_result = rand(1..10)
    weather_result > 9 ? true : false
  end
end
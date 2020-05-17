class Airport
  def initialize(capacity = 20)
    @planes_in = []
    @capacity = capacity
  end

  def forecast
    rand(1..20)
  end

  def land(plane)
    if @planes_in.length == @capacity
      raise 'no space for landing'

    end

    if forecast == 20
      raise 'too stormy to land' if forecast == 20

    end
    
    if @planes_in.include?(plane)
      raise 'this plane is already in the airport' if @planes_in.include?(plane)

    end
    @planes_in << plane
  end

  def take_off(plane)
    raise 'this plane is not in this airport' if @planes_in.include?(plane) == false

    @planes_in.delete(plane)
    return @planes_in
  end
end

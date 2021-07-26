class Airport

  def land(plane)
    raise 'Cannot land plane due to full capacity' if full?
    raise 'Cannot land plane due to stormy weather' if stormy?
    @planes << plane 
  end

  def take_off(plane)
    raise 'Plane cannot take off due to stormy weather' if stormy?
  end 

  def full?
  end

  def stormy?
    rand(1..10) > 6
  end
end

airport = Airport.new
class Airport
  
  def initialize
    @capacity = 20
    @planes = []
  end
end

def land(plane)
  if stormy? == true
    raise 'Cannot land plane as weather is stormy'
  end
end

def take_off(plane)
  if stormy? == true
    raise 'Cannot take off as weather is stormy' 
  end
end

def full?
  if @planes.length >= @capacity
    raise "Airport full"
  end
end

def stormy?
  rand(1..100) >= 50
end

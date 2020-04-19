class Airport
  attr_reader :capacity, :planes
  
  def initialize
    @capacity = 5
    @planes = Array.new
  end

  def empty?
    @planes.count.zero?
  end
  
  def full?
    @planes.count >= @capacity
  end
  
  def in?(plane)
  end
  
  def capacity=(capacity)
    @capacity = capacity if capacity >= 0
  end
  
  def weather
    weather = Weather.new
    weather.stormy? ? :stormy : :sunny
  end

  def add(plane)
    @planes.push(plane)
    @planes.last == plane
  end
  
  def del(plane)
    return false unless @planes.include?(plane)
    
    @planes.delete(plane)
  end
  
end

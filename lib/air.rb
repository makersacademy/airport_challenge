class Air
  attr_reader :planes

  def initialize
    @planes = Array.new
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

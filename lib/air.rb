class Air
  attr_reader :planes

  def initialize
    @planes = Array.new
  end

  def add(plane)
    @planes.push(plane)
    @planes.last == plane
  end

end

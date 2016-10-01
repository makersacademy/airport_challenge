class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Sorry this plane has already landed' if @planes.include? plane
    plane.status = true
    @planes << plane
  end

  def take_off(plane)
    fail 'Sorry no planes to take off' if @planes.empty?
    fail 'This plane is not at the airport' unless @planes.include? plane
    plane.status = false
    @planes.delete(plane)
  end

  def check(plane)
    if @planes.include? plane
      true
    else
      false
    end
  end


end

class Airport
  attr_reader :planes
  def initialize
    @capacity = 5
    @planes =[]
  end

  def send()
    if @planes.length > 0
      return @planes.pop()
    else
      return false
    end
  end

  def receive(plane)
    @planes << plane
  end

  def allow?
    if @planes.length < @capacity
      return true
    else
      return false
    end
  end
end
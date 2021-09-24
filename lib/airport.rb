class Airport
  attr_reader :planes
  def initialize
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
end
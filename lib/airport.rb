class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
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
    if allow?()
      @planes << plane
    end
  end

  def allow?
    if @planes.length < @capacity
      return true
    else
      return false
    end
  end
end
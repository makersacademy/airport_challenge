class Airport
  attr_reader :capacity, :planes, :status

  def initialize(capacity = 50)
    @capacity = capacity
    @planes = []
    @status = "open"
  end

  def close
    @status = "closed"
  end

  def open
    @status = "open"
  end

  def receive(plane)
    @planes.push(plane)
    if @planes.length >= @capacity
      @status = "closed"
    end
  end
end

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :plane
  attr_accessor :capacity
  # def plane
  #   @plane
  # end
  def initialize(capacity: 50)
    @planes = []
    @capacity = capacity
  end
  
  def land(plane)
    fail "Full capacity" if full?

    @planes << plane
  end

  def send_plane
    fail "No planes" if empty?

    @planes.pop
  end

  private
  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= @capacity
  end
  
end

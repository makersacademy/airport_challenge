class Airport

DEFAULT_CAPACITY = 50
attr_reader :planes, :capacity

  def initialize( capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    error_msg(plane)
    @planes << plane
  end

  def takeoff(plane)
    fail 'there are no planes at the airport' if @planes.empty?
    report_status
    @planes.pop
  end

  def report_status
    return "Plane no longer at the airport"
  end

  private

  def error_msg(plane)
    fail 'airport is full' if @planes.size >= DEFAULT_CAPACITY
    fail 'this plane has already landed' if @planes.include?(plane) || @landed == true
  end
end

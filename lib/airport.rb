require_relative 'plane'

class Airport
  # Read permission for value types
  attr_reader :code, :capacity
  # Set default capacity
  DEFAULT_CAPACITY = 100

  # Airport must be initialized with a three-letter code string
  # or symbol, e.g. "LAX", :LAX
  def initialize(code, capacity=DEFAULT_CAPACITY)
    @code = code.upcase.to_sym
    @planes = []
    @capacity = capacity
    @stormy = false
  end

  def stormy?
    generate_weather
    stormy
  end

  def inbound(plane)
    fail "Permission to land denied, #{self} is full" if full?
    dock plane
  end

  def outbound(plane)
    fail "Plane is not currently at #{self}" unless include? plane
    remove plane
  end

  def include?(plane)
    planes.include? plane
  end

  def to_s
    code.to_s
  end

  private
  attr_reader :stormy, :planes

  def full?
    @planes.size >= @capacity
  end

  # NOTE: potentially redundant
  def empty?
    @planes.size <= 0
  end

  def dock(plane)
    @planes << plane
  end

  def remove(plane)
    @planes.delete plane
  end

  # FIXME: extract as module or class
  def generate_weather
    # 1 in 20 chance of weather being stormy
    @stormy = (rand(20) == 0)
  end
end

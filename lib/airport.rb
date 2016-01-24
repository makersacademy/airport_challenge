require_relative 'plane'

class Airport
  # NOTE: consider removing attr_accessors for encapsulation
  attr_reader :code, :capacity, :planes
  # Override default capacity
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
    return stormy
  end

  def inbound(plane)
    raise "Permission to land denied, #{self} is full" if full?
    dock plane
  end

  def outbound(plane)
    raise "#{plane} is not currently at #{self}" if planes.include?(plane)
    remove plane
  end

  # NOTE: consider overwriting #inspect instead of providing read access
  # to @code

  private
  attr_reader :stormy

  def full?
    @planes.size >= @capacity
  end

  def dock(plane)
    @planes << plane
  end

  def remove(plane)
    @planes.delete(plane)
  end

  # FIXME: extract as module or class
  def generate_weather
    # 1 in 20 chance of weather being stormy
    @stormy = (rand(20) == 0)
  end
end

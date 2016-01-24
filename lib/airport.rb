class Airport
  # NOTE: consider removing attr_accessors for encapsulation
  attr_reader :code, :capacity
  # Override default capacity
  DEFAULT_CAPACITY = 100

  # Airport must be initialized with a three-letter code symbol or string, e.g. LAX
  def initialize(code, capacity=DEFAULT_CAPACITY)
    @code = code.upcase.to_sym
    @capacity = capacity
    @stormy = false
  end

  def stormy?
    generate_weather
    return stormy
  end

  private
  attr_reader :stormy

  def generate_weather
    # 1 in 20 chance of weather being stormy
    @stormy = (rand(20) == 0)
  end
end

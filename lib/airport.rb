class Airport
  attr_reader :spaces

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @spaces = Array.new(capacity)
  end
end

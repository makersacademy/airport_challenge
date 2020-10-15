class Airport
  @@airports = []
  DEFAULT_CAPACITY = 10
  attr_accessor :capacity

  def self.list_all_airports
    @@airports
  end

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @@airports << self
  end
end

class Airport
  @@airports = []
  DEFAULT_CAPACITY = 10
  attr_accessor :capacity, :name

  def self.list_all_airports
    @@airports
  end

  def self.clear_all_airports
    @@airports =[]
  end

  def initialize(name = name_new, capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @@airports << self
  end

  private
  def name_new
    if @@airports.size < 1
      "Airport001"
    else
      @@airports[-1].name.succ
    end
  end
end

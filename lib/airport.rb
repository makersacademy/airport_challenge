class Airport

  attr_reader :plane_list, :capacity, :name, :weather

  DEFAULT_CAPACITY = 10

  def initialize(name = "LHR", capacity = DEFAULT_CAPACITY)
    @plane_list = []
    @name = name
    @capacity = capacity
    @weather = Weather.new
  end

  def to_s
    name
  end

  def full?
    capacity == plane_list.length
  end

end

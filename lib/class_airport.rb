class Airport
  @@airports = []
  DEFAULT_CAPACITY = 10
  attr_accessor :capacity, :name, :weather

  def self.list_all_airports
    @@airports
  end

  def self.clear_all_airports
    @@airports = []
  end

  def initialize(name = name_new, capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @weather = 'fine'
    @@airports << self
  end

  def full?
    Plane.list_all_planes.select { |tmp_plane| tmp_plane.location == self }.count == @capacity
  end

  def stormy?
    @weather == 'stormy'
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

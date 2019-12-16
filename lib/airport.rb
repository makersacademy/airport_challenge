class Airport
  DEFAULT_CAPACITY = 20 
  ERROR = {
    full: 'Not enough room, pass the time with fun activities'.freeze,
    empty: 'That aircaft isnt here'.freeze
  }

  attr_reader :aircrafts
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @aircrafts = []
    @capacity = capacity
  end

  def land_plane aircraft
    fail ERROR[:full] if full?

    @aircrafts << aircraft
  end

  def fly_be_free(aircraft)
    fail ERROR[:empty] if @aircrafts.empty?

    @aircrafts.delete(aircraft)
  end

  def docked?(aircraft)
    @aircrafts.include?(aircraft)
  end

private
  def full?
    @aircrafts.length >= @capacity
  end

  def aircraft_count
    @aircafts.count
  end

  def empty?
    aircraft_count.zero?
  end
end

require_relative './weather.rb'
require_relative './plane.rb'

class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Stormy weather, no takeoff or landing possible" if stormy?
    fail "airport is full, no landing space available" if full?
    @planes << plane
  end

  def takeoff_plane
    fail "Stormy weather, no takeoff or landing possible" if stormy?
    fail "No planes in airport" if empty?
    @planes.pop
    status
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= capacity
  end

  def status
    p "There are now #{@planes.count} planes in the airport"
  end

  def stormy?
    Weather.new.flying_conditions    
  end
end

require './lib/weather.rb'

class Airport

  attr_reader :aircraft, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @aircraft = []
  end

  def accept_aircraft(plane)
    fail "Cannot land: airport full." if full?
    aircraft << plane
  end

  def release_aircraft(plane)
    fail "Error: There are no planes to release." if empty?
    fail "ERROR: Not valid plane." if !aircraft.include?(plane)
    aircraft.delete(plane)
  end

  private

  def full?
    aircraft.count >= 10
  end

  def empty?
    aircraft.empty?
  end

end

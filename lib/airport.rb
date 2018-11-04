require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar, :weather
  attr_accessor :capacity

  DEF_CAPACITY = 10

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Airport is full" if full?
    fail "A storm is coming" if @weather.stormy?
    @hangar << plane
  end

  def take_off
    fail "A storm is coming" if @weather.stormy?
  end

  def full?
    @hangar.count >= DEF_CAPACITY
  end

end

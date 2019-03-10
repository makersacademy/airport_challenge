require 'plane'
require 'weather'
require 'airport_module.rb'

class Airport
  include AirportActions
  attr_reader :hangar, :capacity
  attr_accessor :weather, :name 

  DEFAULT_CAPACITY = 10

  def initialize(name = "LHR", capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @name = name
  end

  def land(plane)
    plane_landing_confirmation(plane)
  end

  def takeoff(plane)
    plane_take_off(plane)
  end
end

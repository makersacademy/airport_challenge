require_relative 'weather'
require_relative 'plane'

class Airport
  include Weather
  include Planes

DEFAULT_CAPACITY = 20
  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def in_airport?(arg)
    raise "pass in plane objects only" unless arg.plane?
    @planes.include?(arg)
  end
=begin
  def land(arg)
    raise "airport full, find another lol" if full?
    raise "plane already landed" if @planes.include?(arg)
    raise "pass in plane objects only" unless arg.plane?
    raise "stormy day, no flying" if stormy?
    @planes << arg
  end


  def take_off
   raise "stormy day, no flying" if stormy?
   @planes.pop
=end

  protected

  def full?
    @planes.size >= 20
  end


end

require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather
  
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def approve_take_off plane
    raise "airport is empty" if empty?
    raise "stormy weather can't take off" if stormy?
    @planes.delete plane
    plane.take_off
  end


  def approve_landing plane
    raise "airport is full" if full?
    raise "stormy weather can't land" if stormy?
    @planes << plane
    plane.land

  end

  def empty?
    @planes.empty?
  end


  private
  attr_reader :planes

  def full?
    planes.count >= DEFAULT_CAPACITY
  end


end

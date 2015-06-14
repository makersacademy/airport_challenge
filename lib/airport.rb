require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 2
  attr_accessor :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []


  end

  def approve_take_off plane
    raise "#{self.class.name} is empty" if empty?
    raise "#{self.class.name} has stormy weather" if stormy?
    planes.delete (plane)
    plane.take_off
  end


  def approve_landing plane
    raise "#{self.class.name} is full" if full?
    raise "#{self.class.name} has stormy weather" if stormy?
    @planes << plane
    plane.land
  end

  def empty?
    planes.count == 0
  end

  def check_weather
    weather
  end

  private
  attr_reader :planes

  def weather
    [:sunny, :sunny, :sunny, :stormy].shuffle.first
  end

  def full?
    planes.count >= DEFAULT_CAPACITY
  end


  def stormy?
    weather == :stormy
  end

  def sunny?
    weather == :sunny
  end





  #attr_reader :capacity



end

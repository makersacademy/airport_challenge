require_relative './plane.rb'
require_relative './weather.rb'

class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :hanger, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    raise("The plane can't land as there's a storm") if stormy?
    raise("The plane can't land as the hanger is full") if full?
    raise("#{plane} is already in the hanger") if @hanger.include? plane
    @hanger << plane
  end

  def takeoff(plane)
    raise("The plane can't take off as there's a storm") if stormy?
    raise("#{plane} is not in the hanger") unless @hanger.include? plane
    @hanger -= [plane]
    "#{plane} has left the hanger!"
  end

  def status(plane)
    @hanger.include?(plane) ? "#{plane} is in the hanger" : "#{plane} is flying"
  end

  private
  def stormy?
    Weather.new.stormy == 5
  end

  def full?
    @hanger.length >= @capacity
  end

end

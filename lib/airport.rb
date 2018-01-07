require_relative './plane.rb'
require_relative './weather.rb'

class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise("The plane can't land as there's a storm") if stormy?
    raise("The plane can't land as the hangar is full") if full?
    raise("#{plane} is already in the hangar") if @hangar.include? plane
    @hangar << plane
  end

  def takeoff(plane)
    raise("The plane can't take off as there's a storm") if stormy?
    raise("#{plane} is not in the hangar") unless @hangar.include? plane
    @hangar -= [plane]
    "#{plane} has left the hangar!"
  end

  def status(plane)
    @hangar.include?(plane) ? "#{plane} is in the hangar" : "#{plane} is flying"
  end

  private
  def stormy?
    Weather.new.stormy == 5
  end

  def full?
    @hangar.length >= @capacity
  end

end

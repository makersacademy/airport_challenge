require_relative './plane.rb' # enables me to chat about plane classes without them being in the file
require_relative './weather.rb'

class Airport
  attr_reader :hangar, :capacity # attribute readers, allowa you to read what's in these instance variables.
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY) # initializing these variables so that each airport has these features.
    @capacity = capacity
    @hangar = []
  end

  def fly_plane
    raise ("Stop, no departures or arrivals due to stormy weather!") if stormy?
    raise ("No Planes!") if empty? # throws an error if there isn't any planes.(potentially not needed)

    puts "Skeet Skeet!" # confirms the plane has left.
    @hangar.pop # removes a plane from the hangar once it's gone.
  end

  def land_plane(plane)
    raise ("Stop, no departures or arrivals due to stormy weather!") if stormy?
    raise("Too Full!") if full? # throws an error if there are too many planes. This is specified by either a given or default capacity.
    @hangar << plane # shoves the landed plane in the hangar.
  end

  def stormy?
    Weather.new.forecast
  end

  private # fun key word that prevents programmes from editing this info. These values only apply to their raise functions.

  def empty?
    @hangar.empty?
  end

  def full?
    @hangar.length >= @capacity # makes sure that the hangar isn't at capacity.
  end

end

require_relative './plane.rb'

class Airport
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def fly_plane
    raise("No Planes!") if empty?

    puts "Skeet Skeet!"
    @hangar.pop
  end

  def land_plane(plane)
    raise("Too Full!") if full?

    @hangar << plane
  end
  private
  def empty?
    @hangar.empty?
  end

  def full?
    @hangar.length >= @capacity
  end

end

require_relative './plane.rb'

class Airport

  attr_accessor :capacity, :stormy, :condition
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane = Plane.new)
    fail 'The plane cannot land' unless !stormy && @planes.length < @capacity
    @planes << plane
    plane.flying = false
    "Successful Landing"
  end

  def take_off
    fail 'There are no planes to take off' unless !@planes.empty?
    fail 'Bad Weather' unless !stormy
    @planes.pop()
    "Successful takeoff"
  end

  private

  def stormy
    @condition = rand(6)
    @condition == 4
  end

end

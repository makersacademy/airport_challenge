require './lib/plane.rb'

class Airport

attr_reader :capacity, :planes

DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_plane
    return false if empty? || stormy?
    @planes.pop
  end

  def dock(plane)
    fail 'Airport unavailable' if full? || stormy?
    @planes << plane
  end

  def stormy?
    forcast = rand(1..30)
    if forcast < 10
      'stormy'
    else
      'sunny'
    end
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end

end

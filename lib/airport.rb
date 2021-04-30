require_relative './plane.rb'
class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = rand(1..10)
  end

  def land_plane(plane)
    fail 'Airport full' if full?

    fail "Stormy weather - landing not permitted" if stormy?

    fail "Plane already grounded" if plane.landed?

    @planes << plane
  end

  def take_off(plane)
    fail "Stormy weather - take off not permitted" if stormy?

    fail "Plane currently flying" unless plane.landed?

    @planes.delete(plane)
  end

  def full?
    @planes.count >= capacity
  end

  def stormy?
    if @weather <= 1
      true
    else
      false
    end
  end

end

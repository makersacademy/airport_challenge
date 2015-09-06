require '~/Projects/airport_challenge/lib/plane.rb'
class Airport
  HANGAR_CAPACITY = 10
  # attr_accessor :plane
  attr_reader :capacity, :hangar
  def initialize
    @hangar = []
    @capacity = HANGAR_CAPACITY #Why does this need to be in capitals?
    # @plane = plane
  end

  def take_off(plane)
    fail "It's stormy, no taking off" if weather == "stormy"
    hangar.pop
  end

  def land(plane)
    fail "That plane is already in the hangar" if hangar.include?(plane)
    fail "Hangar full, no landing" if full?
    fail "It's stormy, no landing" if weather == "stormy"
    hangar << plane
  end

  private

  def full?
    hangar.count >= capacity
  end

  def weather
    ["stormy","sunny"].sample
  end
end

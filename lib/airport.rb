require_relative 'plane'

class Airport

  attr_accessor :capacity
  attr_accessor :hangar

  def initialize (capacity=2)
    @capacity = capacity
    @hangar = []
  end

  def land plane
    if hangar.count >= capacity
      'airport full, permission denied'
    else
      hangar << plane
      plane::status = "landed"
    end
  end

  def take_off plane
    plane::status = "flying"
    hangar.pop
  end

  private

  # attr_reader :hangar

  def full?
    hangar.count >= capacity
  end
end
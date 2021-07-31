# require "./plane.rb"
# 
class Airport
  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 12

  def initialize(capacity = 12)
    @hangar = []
    @capacity = capacity
  end

  def land(planes)
    (hangar_full?) ? (raise 'Hangar is full!') : (@hangar.push(planes))
  end

  def takeoff
    @hangar.pop
  end

  def hangar_full?
    @hangar.count >= DEFAULT_CAPACITY
  end
end

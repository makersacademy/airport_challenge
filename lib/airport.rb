require_relative "./plane.rb"

class Airport
  attr_reader :identifier, :capacity, :planes_parked

  DEFAULT_CAPACITY = 50

  def initialize(identifier = :default_identifier, capacity = DEFAULT_CAPACITY)
    @identifier = identifier
    @capacity = capacity
    @planes_parked = []
  end

  def park(plane)
    raise "Airport is full" if full?
    plane.arrive_at(self)
    @planes_parked << plane
  end

  private

  def full?
    planes_parked.count >= 50 ? true : false
  end

end

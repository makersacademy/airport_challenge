require_relative 'plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def permission_to_land(plane)
    taxi_to_hangar(plane)
    'Safe to land'
  end

  private

  def taxi_to_hangar(plane)
    hangar << plane
  end
end

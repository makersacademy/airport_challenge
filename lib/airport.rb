require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def dock(plane)
    @planes << plane
  end

  def check_for_landed(plane)
    @planes.include? plane
  end

  def release(plane)
    @planes.delete(plane)
  end
end

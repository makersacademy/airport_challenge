require_relative '../lib/plane'

class Airport
  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def takeoff(plane)
    @hangar.delete(plane)
  end

  def status
    "There are #{@hangar.count} planes here"
  end

private
  def empty
    @hangar.count.zero?
  end
end

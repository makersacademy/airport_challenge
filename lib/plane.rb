require_relative 'airport'

class Plane

  attr_reader :location

  def land
    fail "Already landed" if landed?

    @location = :landed
  end

  def take_off
    fail "Already flying" if flying?

    @location = :flying
  end

  def landed?
    @location == :landed
  end

  def flying?
    @location == :flying
  end
end
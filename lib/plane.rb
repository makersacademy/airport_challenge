class Plane
  attr_accessor :status, :location

  def initialize
    @status = :flying
    @location = :air
  end

  def land
    @status = :landed
    @location = :airport
  end

  def take_off
    @status = :flying
    @location = :air
  end
end
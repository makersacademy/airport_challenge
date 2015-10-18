class Plane
  attr_reader :status, :location

  def initialize
    @location = :air
    @status = :flying
  end

  def land(airport)
    fail 'A landed plane cannot land' if status == :landed
    @location = airport
    @status = :landed
  end

  def take_off
    fail 'A flying plane cannot take off' if status == :flying
    @location = :air
    @status = :flying
  end
end

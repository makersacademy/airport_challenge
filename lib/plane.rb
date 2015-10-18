class Plane
  attr_reader :status, :location

  def initialize
    @status = :flying
    @location = :air
  end

  def land(airport)
    raise 'A landed plane cannot land' if status == :landed
    @location = airport
    @status = :landed
  end

  def take_off
    raise 'A flying plane cannot take off' if status == :flying
    @location = :air
    @status = :flying
  end
end

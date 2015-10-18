class Plane
  attr_reader :status, :location

  def initialize
    @location, @status = :air, :flying
  end

  def land(airport)
    raise 'A landed plane cannot land' if status == :landed
    @location, @status = airport, :landed
  end

  def take_off
    raise 'A flying plane cannot take off' if status == :flying
    @location, @status = :air, :flying
  end
end

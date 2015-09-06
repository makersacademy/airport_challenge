class Plane

  def initialize
    @status = :flying
  end

  def flying?
    status == :flying
  end

  def take_off_from(airport)
    fail 'Too stormy' if airport.permission_to_take_off == :stormy
    self.status = :flying
  end

  def landed_at?(airport)
    status == airport
  end

  def land_at(airport)
    fail 'Airport is full' if airport.permission_to_land == :full
    fail 'Too stormy' if airport.permission_to_land == :stormy
    self.status = airport
  end

  private

  attr_accessor :status

end

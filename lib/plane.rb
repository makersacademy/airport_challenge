class Plane

  def initialize
    @status = :flying
  end

  def flying?
    status == :flying
  end

  def take_off_from(airport)
    fail 'Too stormy' unless airport.permission_to_take_off?
    self.status = :flying
  end

  def landed_at?(airport)
    status == airport
  end

  def land_at(airport)
    fail 'Airport is full' unless airport.permission_to_land?
    self.status = airport
  end

  private

  attr_accessor :status

end

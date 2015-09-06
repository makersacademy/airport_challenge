class Plane

  def initialize
    @status = :flying
  end

  def flying?
    status == :flying
  end

  def landed_at?(airport)
    status == airport
  end

  def land_at(airport)
    self.status = airport
  end

  def take_off_from(_airport)
    self.status = :flying
  end

  private

  attr_accessor :status

end

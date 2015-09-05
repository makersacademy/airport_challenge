class Plane

  def initialize
    @status = :flying
  end

  def flying?
    status == :flying
  end

  def landed?
    status != :flying
  end

  def land_at(airport)
    self.status = airport
  end

  def take_off_from(airport)
    self.status = :flying
  end

  private

  attr_accessor :status

end

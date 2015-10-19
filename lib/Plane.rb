class Plane
  attr_reader :status

  def initialize
    @status = :flying
  end

  def land
    fail 'Plane is already on the ground!' unless @status == :flying
    @status = :grounded
  end

  def take_off
    fail 'Plane already in flight!' unless @status == :grounded
    @status = :flying
  end

end

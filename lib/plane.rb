class Plane

  attr_reader :flying_status

  def initialize
    @flying_status = false
  end

  def not_flying
    fail 'Plane is not flying' unless flying_status
    @flying_status = false
  end

  def flying
    fail 'Plane is already flying' if flying_status
    @flying_status = true
  end

end

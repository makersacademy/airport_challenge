class Plane
  attr_reader :flying_status

  def initialize
    @flying_status = true
  end

  def fly
    @flying_status = true
  end

  def dont_fly
    @flying_status = false
  end

end

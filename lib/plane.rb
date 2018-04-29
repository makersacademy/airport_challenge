class Plane
  attr_reader :id
  attr_accessor :flying

  def initialize(id)
    @id = id
    @flying = true
  end

  def land
    raise 'Plane is not flying' unless @flying
    @flying = false
  end

  def take_off
    raise 'Plane is flying' if @flying
    @flying = true
  end

  def flying?
    @flying
  end

end

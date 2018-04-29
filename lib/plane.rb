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

  def flying?
    @flying
  end

end

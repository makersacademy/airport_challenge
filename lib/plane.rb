class Plane
  attr_reader :id
  attr_accessor :flying

  def initialize(id)
    @id = id
    @flying = false
  end

  def flying?
    @flying
  end

end

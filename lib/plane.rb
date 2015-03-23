class Plane

attr_accessor :status

  def initialize
    @status = 'flying'
  end

  def flying
    @status = 'flying'
  end

  def grounded
    @status = 'grounded'
  end
end

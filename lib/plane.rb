class Plane
  attr_reader :status, :locations

  def initialize
    @status = 'flying'
  end

  def location
    @status == 'flying' ? 'air' : 'airport'
  end
end

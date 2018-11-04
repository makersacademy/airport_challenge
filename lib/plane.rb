require_relative 'airport'

class Plane
  attr_reader :status

  def initialize
    @status = flying
  end

  def flying
    @status = "Flying"
  end

  def landed
    @status = "Landed"
  end

end

class Plane
  attr_reader :status, :takeoff
  def initialize
    @status = 'flying'
  end

  def flying
    @status = 'flight in progress'
  end

  def land
    @status = 'landed'
  end
end
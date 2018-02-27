class Plane
  attr_reader :status

  def initialize
    @status = 'flying'
  end

  def adjust_status(status)
    @status = status
  end
end

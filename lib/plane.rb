class Plane
  attr_accessor :flying
  # def status(status)
  #   @status = status
  # end

  def initialize
    @flying = false
  end

  def take_off
    @flying = true
  end
end

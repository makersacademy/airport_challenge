class Plane

  attr_accessor :status # allowing getter method to call .status on new objects

  def initialize(status = true)
    @status = status

  end

  def in_air?(status = true)
    status
  end

end

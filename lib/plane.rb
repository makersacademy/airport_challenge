class Plane

  attr_accessor :status # allowing getter method to call .status on new objects

  def initialize(status = "landed")
    @status = status
  end

end

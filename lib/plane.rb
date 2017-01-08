class Plane

  attr_accessor :status # allowing getter method to call .status on new objects

  def initialize(status = true) # status = true -> plane is flying
    @status = status
  end

end

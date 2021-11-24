class Plane
  attr_accessor :status, :airport
  def initialize(status = "flying", airport = "none")
    @status = status
    @airport = airport
  end
end

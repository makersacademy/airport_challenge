class Plane

  def initialize(status = true, airport = "London")
    @status = status
    @airport = airport
  end

  attr_accessor :status
  attr_accessor :airport
end

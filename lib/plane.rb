# Plane class definition
class Plane
  attr_accessor :id, :airport

  def initialize(id, airport = nil)
    @id = id
    @airport = airport
  end

end

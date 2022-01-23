# create a Plane class, with attribute of status
class Plane
  attr_accessor :status

  # Plane class will have a status of flying by default, then set 
  # by airport methods take_off and land
  def initialize(status = "flying")
    @status = status
  end

end

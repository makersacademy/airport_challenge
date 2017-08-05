class Plane
  attr_writer :plane_landed, :plane_taking_off

  attr_writer :status

  def initialize
    @status= false
  end
  
  def permission?
    @status= true
  end


end
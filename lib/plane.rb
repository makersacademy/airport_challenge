# Defines the Class Plane

class Plane
  attr_accessor :status

  def initialize(status)
    @status = status
  end  

  # TODO - do we actually need these "shortcuts" on status when we have status?
  def airbourne?
    @status == "airbourne"
  end  

  def grounded?
    @status == "grounded"
  end  
end

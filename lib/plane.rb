class Plane 
  attr_reader :plane, :lastlandedairport, :status, :planeid
    
  def initialize(airport = 900)

    @planeid = object_id
    @status = "landed"
    @lastlandedairport = airport 

  end
   
  def return_plane_info

    return @lastlandedairport, @status

  end

end

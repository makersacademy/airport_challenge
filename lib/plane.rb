class Plane
 #set a global variable to be incremented on each new plane creation.
 attr_accessor :planeLastAssignednumber, :lastairport, :status
 #planeLastAssignednumber = 0
  def initialize
   
   @planeLastAssignednumber = 1 # removing for testing purposes@@planeLastAssignednumber + 1
   @lastairport = nil
   @status = "landed"
   return @planeLastAssignednumber, @lastairport, @status
  end
  
  def return_plane_info
    return @planeLastAssignednumber, @lastairport, @status
  end
## attr reader set on Plane identifier, and att writer set on current status / last airport    
## it would instantiate with ["Plane identifier", perhaps sequential number so never repeated, Last airport would be nil, and current status would be landed]

#The method would return this information to airport

end

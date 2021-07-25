class Plane 
    attr_reader :plane, :lastlandedairport, :status, :planeid
    
    def initialize (airport = 900)
        @planeid = self.object_id
        @status = "landed"
        @lastlandedairport = airport #needs to be id of object
        
    end
   
  
  def return_plane_info
    return @lastlandedairport , @status
  end
## attr reader set on Plane identifier, and att writer set on current status / last airport    
## it would instantiate with ["Plane identifier", perhaps sequential number so never repeated, Last airport would be nil, and current status would be landed]

#The method would return this information to airport

end

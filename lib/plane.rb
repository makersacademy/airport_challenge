    class Plane
  
    def initialize                      # initial conditions of plane sky - on the sky, ground - on the ground 
    @flying = true                    # main var which describes condition of the plane        
    return "plane is flying"
    end
   
    def land                            # when on the ground or landing
    @flying = false
    return "plane is landed" 
    end
  
    def flying?                         # whether aircraft is flying?  
    @flying 
    end
 
    def take_off                        #  when aircraft is taking off 
    @flying = true                       
    return "plane is taking off"
    end
    end

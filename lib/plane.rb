require_relative 'airport'
require_relative 'weather'

class Plane

attr_accessor :flying

  def switch_flying
    if @flying == false
     @flying = true
   else @flying == true
     @flying = false
   end
 end




  def land_at(airport)

    if airport.capacity == airport.landing_bay.length
      return "Airport is to full to land this plane"
    end

    if Weather.new.right_now == "Sunny"
    puts "The weather is sunny and so we can land .. \n"
    puts "plane has now landed at the airport\n"
    @flying = false
    return airport.store_plane(self)

    else
      "Can't land right now due to stormy weather"
    end
  end

  def take_off_from(airport)

    if Weather.new.right_now == "Sunny"
        puts "The plane has now taken to the air\n"
        @flying = true
        return  airport.landing_bay.delete(self) #delete method deletes froma array and returns

     else
        "Can't take off right now due to stormy weather"
     end

  end






  # def take_off
  #   "Plane is now flying"
  # end


end

require_relative 'plane'

class Airport
  def take_off
    types = ['sunny', 'stormy']
    @weather = types.sample
    if @weather == 'stormy'
      return "Flight delayed"  
    else
      @weather == 'sunny'
      return "Plane has left the airport."  
    end  
  end
end
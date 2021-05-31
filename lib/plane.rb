require_relative 'airport'
require_relative 'weather'

class Plane
  attr_reader :status, :sky

 def land_at(airport)
    fail "Unable to land, the airport is full!" if airport.full
    @status = "landed"
  end

  def take_off
    
    case @status
    when "grounded" 
      fail "The weather is too stormy to fly!" 
    when "flying" || nil
      fail "Your airplane is still in the air."
    when "good to go"
      @status = "flying"
    else
      @status = "flying"
    end
  end

  def ready_to_go?
   @clime = Weather.new.ok?

   @clime == "clear" ? @status = "good to go" : @status = "grounded"
  end 
end
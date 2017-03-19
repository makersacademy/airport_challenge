require './lib/weather_check.rb'

class Plane
  include Weather
  attr_reader :status #Call status to confirm that it has landed.

  def initialize
    @status = "Flying" #Starts with "Flying" status.
  end

  def land(airport)
    if land_status? && weather_check? #If passing, land.
      @status = airport #Land the plane.
    elsif land_status? == false #Is NOT TRUE. WHY
      raise "Plane can only land if status is set to flying."
   else
     raise "Plane cannot land due to stormy weather."
   end
 end

  def takeoff(airport)
    if takeoff_status?(airport) && weather_check? #If at the airport where landed, takeoff.
      @status = "Flying" #Change status.
    elsif takeoff_status?(airport) == false
      raise "Plane can only takeoff if it's located at the airport where it landed." #If not, raise error.
    else
      raise "Plane cannot takeoff due to stormy weather."
    end
  end

  private

def land_status?
  if @status == "Flying"
    true
  else
    false
  end
end

def takeoff_status?(airport)
  if @status == airport
  true
else
  false
end
end
end


#planes that are already flying cannot takes off and/or be in an airport;

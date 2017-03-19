require './lib/weather_check.rb'

class Plane
  include Weather
  attr_reader :status #Call status to confirm that it has landed.

  def initialize
    @status = "Flying" #Starts with "Flying" status.
  end

  def land(airport)
    if land_status? #If passing, land.
       @status = airport #Change status
     else
      raise "Plane can only land if status is set to flying." #If not, raise error.
     end
   end

  def takeoff(airport)
    if takeoff_status?(airport) #If at the airport where landed, takeoff.
      @status = "Flying" #Change status.
    else
      raise "Plane can only takeoff if it's located at the airport where it landed." #If not, raise error.
    end
  end

  private

def land_status?
  true if @status == "Flying"
end

def takeoff_status?(airport)
  true if @status == airport
end
end


#planes that are already flying cannot takes off and/or be in an airport;

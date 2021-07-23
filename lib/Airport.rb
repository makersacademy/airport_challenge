
class Airport
    attr_reader :planes
  #need to set capacity of airport as global constant
    def initialize
    #no. of planes at the airport
    @planes = 0
    
  end

  def instructlanding_at_airport(weather, plane)
   if weatherok(weather) == true
    #land the plane - update the planes status and airport values
    #planetoupdate = plane
    #planetoupdate.status = "landed"
    #planetoupdate.lastairport = self
    plane.status = "landed"
    plane.lastairport = self
    #increment the airport landed at plane list by 1
    @planes += 1
    return true
   else
    return false
   end    
  end

  def weatherok(weather = rand(10))
    if weather == 10
      false
    else
      true
    end
  end
end

 p airport = Airport.new
 p airport.weatherok(10)
 p airport.weatherok(9)
 p @airport_array
# require 'Airport'
#   describe 'Air Traffic Control' do
#     it 'tells the plane to land at the airport when not stormy' do
#     airport1 = Airport.new
#    #note not passing airport at this time
#     expect(airport.instructlanding_at_airport).to eq(true)
#   end
#   end
require 'Airport'
require 'plane'
  describe 'Air Traffic Control' do
   #call prevent landing when stormy then do not land if true, else land, set airport variable, , set landed/flying variable
    it 'tells the plane to land at the airport when not stormy' do
    airport = Airport.new
    plane = Plane.new
    plane.status = "flying"
    expect(airport.instructlanding_at_airport(9, plane)).to eq(true)
    #expect(plane.planeLastAssignednumber).to eq(777)
    end

    it 'tells the plane not land at the airport when it is stormy' do
    airport = Airport.new
      
    expect(airport.instructlanding_at_airport(10)).to eq(false)
    end
    it 'records the airport that it landed at' do
       airport1 = Airport.new

        
      # expect(airport.instructlanding_at_airport(9)).to eq(false, "landed")
    end

    # it 'updates the plane count' do
    #    airport = Airport.new
    #    # work out how to match @planecount value        
    #   expect(airport.instructlanding_at_airport(9)).to eq(false, 1)
    # end


    
  end
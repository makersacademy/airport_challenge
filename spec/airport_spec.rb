require 'airport'

describe AirPort do

    it 'expects airport plane to respond' do
        airport = AirPort.new
        expect(airport).to respond_to :plane
    end

    it 'expects instruction to respond' do
        airport = AirPort.new
        expect(airport).to respond_to :instruction
    end

    it 'send instruction to the plane' do
        airport = AirPort.new
        expect(airport.instruction("take off")).to eq "take off"
    end

    it 'asks the plane to land at a runway' do
        airport = AirPort.new 
        landing_plane = AirPlane.new        
        expect(airport.land_to_runway(landing_plane)).to include(landing_plane) 
    end

    it 'receives confirmation that the plane has left the airport' do
        airport = AirPort.new
        expect(airport.confirmation_message("Confirmed - take off")).to eq "Confirmed - take off"
    end

    it 'expects plane to take off' do
        airport = AirPort.new
        landing_plane = AirPlane.new  
        airport.land_to_runway(landing_plane)
        
        expect(airport.leave_runway(landing_plane)).not_to include(landing_plane)
    end
        

end
require 'airport'

describe AirPort do

    it 'send instruction to the plane' do
        airport = AirPort.new
        expect(airport).to respond_to :instruction
    end

    it 'asks the plane to land' do
        airport = AirPort.new 
        landing_plane = AirPlane.new        
        expect(airport.land_to_runway(landing_plane)).to include(landing_plane) 
    end

    it 'receives confirmation that the plane has left the airport' do
        airport = AirPort.new
        expect(airport.confirmation_message("Confirmed - take off")).to eq "Confirmed - take off"
    end

    it 'expects plane to leave' do
        airport = AirPort.new
        plane = AirPlane.new  
        airport.land_to_runway(plane)
             
        expect(airport.leave_runway(plane)).not_to include(plane)
    end

    describe 'plan land on a runway' do                  
        it 'raises an error when airport is full' do
            AirPort::DEFAULT_CAPACITY.times do
                subject.land_to_runway AirPlane.new
            end
            expect { subject.land_to_runway AirPlane.new }.to raise_error 'Airport full'
        end
    end

    describe 'weather checker' do

        it 'to see if we can get to boolean stormy' do
            airport = AirPort.new            
            expect(airport).to respond_to :stormy?         
        end
                                          
        it 'to see if we can see if it is stormy' do
            airport = AirPort.new
            expect(airport.report_stormy(true)).to eq true
        end

        it 'stops a plane from leaving' do
            airport = AirPort.new
            airport.report_stormy(true)
            plane = AirPlane.new
            expect { airport.leave_runway(plane) }.to raise_error 'Too Stormy' 
        end
        
        it 'allows a plane to land' do
            airport = AirPort.new
            airport.report_stormy(true)
            plane = AirPlane.new
            expect { airport.land_to_runway(plane) }.to raise_error 'Too Stormy' 
        end        
    end
end
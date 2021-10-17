require 'airport'

describe Airport do
    airport = Airport.new(20)
    # subject(:airport) { described_class.new(weather_reporter, 20)} 
    let(:plane) { double :plane} 
    # let(:weather_reporter) { double :weather_reporter}

describe '#land' do 
    context 'when not stormy' do 
        before do 
            # allow(weather_reporter).to receive(:stormy?).and_return false
            allow(airport).to receive(:stormy?).and_return false
        end
        # ------ First User Story Test------------------
        # I want to instruct a plane to land at an airport
        it 'instructs a plane to land' do
            expect(airport).to respond_to(:land).with(1).argument
        end
    # ------Third User Story Test------------------ 
    # I want to prevent landing when the airport is full
        context 'when full' do 
         it 'raises an error' do 
            20.times do
                airport.land(plane)
            end
            expect {airport.land(plane)}.to raise_error "Airport full!"
         end
        end

    end
     context 'when stormy' do 
        # ------Sixt User Story Test -----------------
        #  I want to prevent landing when weather is stormy  
        it 'prevent landing'do 
            # allow(weather_reporter).to receive(:stormy?).and_return true
            allow(airport).to receive(:stormy?).and_return true
            expect{ airport.land(plane)}.to raise_error 'Cannot land: Weather is stormy?'
        end
     end
   
    end
describe '#take_off' do
    context 'when not stormy'do 
        # ------Second User Story Test------------------ 
        #  I want to instruct a plane to take off from an airport ⛔️ and confirm that it is no longer in the airport
        it 'instruct a plane to take off' do 
            expect(airport).to respond_to(:take_off).with(1).argument
        end 
        
        
    end
    context 'when stormy' do 
        before do 
            # allow(weather_reporter).to receive(:stormy?).and_return true
            allow(airport).to receive(:stormy?).and_return true
        end
        # ------Fifth User Story Test ------------------
        #  I want to prevent takeoff when weather is stormy 
        it 'prevent take off'do 
        expect{ airport.take_off(plane)}.to raise_error 'Cannot take_off: Weather is stormy?'
        end
    end  
 end
#   describe '#planes' do 
#          # -----------Forth User Story ---------------
#          # I would like a default airport capacity that can be overridden as appropriate
#     before do 
#         allow(weather_reporter).to receive(:stormy?).and_return false 
#     end
#     it 'return planes at the airport' do 
#         airport.land(plane)
#         expect(airport.planes).to include plane
#     end
#     it 'does not return planes that have taken off' do 
#          airport.land(plane)
#          airport.take_off(plane )
#          expect(airport.planes).not_to include plane 
#     end
#   end

#   context 'defaults' do     
#     subject(:default_airport) {described_class.new(weather_reporter)}
#     it 'has a default capacity' do 
#         allow(weather_reporter).to receive(:stormy?).and_return false
#         described_class::DEFAULT_CAPACITY.times {default_airport.land(plane)}
#         expect{ default_airport.land(plane)}.to raise_error 'Airport full!'
#     end

#   end

end


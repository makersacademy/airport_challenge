require 'airport'     # Require 'plane' in order to double instances of the Plane class? No

describe Airport do  
    subject(:airport) { described_class.new }
    let(:mockPlane) { double :plane }       # let(:plane) { instance_double("Plane") }
    let(:mockWeather) { double :weather }   # let(:weather) { instance_double("Weather") }
    # let(:calmWeather) { double :weather, conditions_safe? => true }
    # let(:stormyWeather) { double :weather, conditions_safe? => false }
    # let(:spyPlane) { spy :plane_double}
    # let(:spyWeatherStation) { spy :weather_station_double, conditions_safe? => true}
    
    describe ' #initialize ', :initialize do 
        it 'with an empty @hangar' do 
            expect(subject.hangar).to be_empty           
        end
        it 'with a default capacity of 1' do
            expect(subject.capacity).to eq 1
        end
        it 'allows for variable capcity' do
            large_airport = Airport.new(50)           # diff_capacity = 30
            expect(large_airport.capacity).to eq 50   # large_airport = Airport.new(diff_capacity)
        end                                           # exepect(large_airport.capacity).to eq diff_capacity
    end
    
    describe ' #status ', :status do 
        before { subject.hangar << mockPlane}
        it 'provides Plane location' do 
            expect(subject.status(mockPlane)).to eq("#{mockPlane} is in the hangar")
        end
    end

    describe ' #take_off ', :take_off do 
        before { subject.hangar << mockPlane}
        it { is_expected.to respond_to(:take_off).with(1).argument }
    end

    context 'when the weather is stormy' do 
    
        describe ' #take_off ', :take_off do
            before { subject.hangar << mockPlane}
            it 'raises an error' do 
                allow(mockWeather).to receive(:conditions_safe?).and_return(false)
                expect { airport.take_off(mockPlane) }.to raise_error('WARNING - Weather is stormy')
            end 
        end


        # context 'when weather is calm' do  
        #     it 'allows Plane to launch' do 
        #         allow(mockWeather).to receive(:conditions_safe?).and_return(true) 
        #         allow(mockPlane).to receive(:fly).and_return(true)
        #         subject.take_off(mockPlane)   # expect(mockPlane.flying).to eq true
        #         expect(mockPlane).to have_received(:fly)
        #     end
        #     it 'confirms Plane is no longer at the airport' do 
        #         allow(mockWeather).to receive(:conditions_safe?).and_return(true) 
        #         allow(mockPlane).to receive(:fly)
        #         expect(subject.take_off(mockPlane)).to eq("#{mockPlane} has left the airport")
        #     end
        # end
        # context 'when weather is stormy' do 
        #     # let(:stormyWeather) { double :weather, conditions_safe? => false }
        #     it 'denies Plane launch' do 
        #         allow(mockWeather).to receive(:conditions_safe?).and_return(false) 
        #         allow(mockPlane).to receive(:fly).and_return(false)
        #         expect{ subject.take_off(mockPlane) }.to raise_error('WARNING - Weather is stormy')
        #     end
        # end
    end

    describe ' #land ', :land do
        it { is_expected.to respond_to(:land).with(1).argument }

        context 'when weather is calm' do 

        it 'adds Plane to @hangar' do
                allow(mockWeather).to receive(:conditions_safe?).and_return(false)
                subject.land(mockPlane)
                expect(subject.hangar).to include(mockPlane)
        end
    end
        # context 'when weather is calm' do 
        #     it 'allows Plane to land' do 
        #         allow(mockWeather).to receive(:conditions_safe?).and_return(true)
        #         subject.land(mockPlane)
        #         expect{ subject.status(mockPlane) }.to eq ("#{mockPlane} is in the hangar")
        #     end
        # end
        # context 'when weather is stormy' do
        #         it 'denies Plane landing' do 
        #         allow(mockWeather).to receive(:conditions_safe?).and_return(false)
        #         expect{ subject.land(mockPlane) }.to raise_error('WARNING - Weather is stormy')
        #     end
        # end
    end

    # it 'wont land planes in a full airport' do
    #     Airport::DEFAULT_CAPACITY.times { subject.land(flying_plane, calm_weather) }
    #     expect { subject.land(flying_plane, calm_weather) }.to raise_error 'Airport full.'
    #   end



end
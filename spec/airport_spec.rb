require 'airport'      # Require 'plane' in order to double instances of the Plane class? No

describe Airport do  
    subject(:airport) { described_class.new } # let(:mockFlyingPlane) {double :plane, :flying => false} OK?
    let(:mockPlane) { double :plane }   # Can you add real/dummy objects to hangar array?
    let(:mockWeather) { double :weather }
    let(:calmWeather) { double :weather, safe_conditions => true }
    let(:stormyWeather) { double :weather, safe_conditions => false }

    describe ' #initialize ', :initialize do 
        it 'with an empty @hangar' do 
            expect(subject.hangar).to be_empty           
        end
        it 'with a default capacity of 1' do
            expect(subject.capacity).to eq 1
        end
        it 'allows for variable capcity' do
            large_airport = Airport.new(50)
            expect(large_airport.capacity).to eq 50
        end
    end

    # describe ' #status ', :status do 
    #     before { subject.hangar << mockPlane}
    #     it 'provides Plane location' do 
    #         expect(subject.status(mockPlane)).to eq("#{mockPlane} is in the hangar")
    #     end
    # end

    describe ' #take_off ', :take_off do 
        before { subject.hangar << mockPlane}
        it { is_expected.to respond_to(:take_off).with(1).argument }
        context 'when weather is calm' do
            # let(:calmWeather) { double :weather, conditions_safe => true }
            it 'allows Plane launch' do 
                allow(mockWeather).to receive(:conditions_safe).and_return(true) 
                # allow(mockPlane).to receive(:fly).and_return(true)
                # allow(mockPlane).to receive(:flying?).and_return(true)
                subject.take_off(mockPlane)
                # expect(mockPlane.flying).to eq true
                expect(mockPlane).to have_received(:fly)
            end
            it 'confirms Plane is no longer at the airport' do 
                allow(mockWeather).to receive(:conditions_safe).and_return(true) 
                allow(mockPlane).to receive(:fly).and_return(true)
                allow(mockPlane).to receive(:flying?).and_return(true)
                expect(subject.take_off(mockPlane)).to eq("Airborne")
            end
        end
        context 'when weather is stormy' do 
            # let(:stormyWeather) { double :weather, generate_conditions => 'Stormy' }
            it 'denies Plane launch' do 
                allow(mockWeather).to receive(:conditions_safe).and_return(false) 
                allow(mockPlane).to receive(:fly).and_return(false)
                expect{ subject.take_off(mockPlane) }.to raise_error('WARNING - Weather is stormy')
            end
        end
    end

    describe ' #land ', :land do
        it { is_expected.to respond_to(:land).with(1).argument }
        it 'adds Plane to @hangar' do
                subject.land(mockPlane)
                expect(subject.hangar).to include(mockPlane)
        end
        context 'when weather is calm' do 
        #   let(:stormyWeather) { double :weather, conditions_safe => true }
            # it 'allows Plane landing' do 
            #     allow(mockWeather).to receive(:conditions_safe?).and_return(true)
            #     subject.land(mockPlane)
            #     expect(subject.status(mockPlane)).to eq ("#{plane} is in the hangar")
            # end
        end
        context 'when weather is stormy' do
            # let(:stormyWeather) { double :weather, conditions_safe => false }
                it 'denies Plane landing' do 
                allow(mockWeather).to receive(:conditions_safe?).and_return(false)
                expect(subject.land(mockPlane)).to raise_error('WARNING - Weather is stormy')
            end
        end
    end


end
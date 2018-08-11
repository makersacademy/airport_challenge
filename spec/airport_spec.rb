# UR1. Instruct a plane to land at an airport
# UR2. Instruct a plane to take off from an airport and confirm it's no longer in the airport
# UR3. Prevent takeoff when weather is stormy 
# UR4. Prevent landing when weather is stormy 
# UR5. Prevent landing when the airport is full 
# SR1. Default airport capacity that can be overridden as appropriate

require 'airport'
# require 'plane' # Do I need to require 'plane' in order to double instances of the Plane class? No

describe Airport do  
    subject(:airport) { described_class.new }   # let(:mockFlyingPlane) { double :plane, :flying => false } # OK?

    let(:mockPlane) { double :plane }           # let(:mockHangar) { double :hangar } # Can you add real/dummy objects to hangar array?
    let(:mockWeather) { double :weather }
    let(:calmWeather) { double :weather, generate_conditions => 'Calm' }
    let(:stormyWeather) { double :weather, generate_conditions => 'Stormy' }

    describe '#initialize' do 
        it 'with an empty @hangar' do 
            expect(subject.hangar).to be_empty           
        end
        it 'with a default capacity of 20' do
            expect(subject.capacity).to eq 20
        end
        it 'allows for variable capcity' do
            large_airport = Airport.new(50)
            expect(large_airport.capacity).to eq 50
        end
    end

    describe '#land', :land do
        it { is_expected.to respond_to(:land).with(1).argument }
        it 'adds Plane to @hangar' do
            subject.land(mockPlane)
            expect(subject.hangar).to include (mockPlane)
        end
        context 'when weather is calm' do 
            it 'allows Plane landing' do 
            end
        end
        context 'when weather is stormy' do
            it 'denies Plane landing' do 
            end
        end
    end

    describe '#take_off', :take_off do 
        before { subject.hangar << mockPlane}
        it { is_expected.to respond_to(:take_off).with(1).argument }
   
        context 'when weather is calm' do
            let(:calmWeather) { double :weather, generate_conditions => 'Calm' }
            it 'allows Plane launch' do 
                allow(mockPlane).to receive(:fly).and_return(true)
                allow(mockPlane).to receive(:flying?).and_return(true)
                subject.take_off(mockPlane)
                expect(mockPlane.flying?).to be true
            end
            it 'confirms Plane is no longer at the airport' do 
                allow(mockPlane).to receive(:fly).and_return(true)
                allow(mockPlane).to receive(:flying?).and_return(true)
                expect(subject.take_off(mockPlane)).to eq "#{mockPlane} has left the airport"
            end
        end

        context 'when weather is stormy' do 
            let(:stormyWeather) { double :weather, generate_conditions => 'Stormy' }
            it 'denies Plane launch' do 
                # allow(mockWeather).to receive(:generate_conditions).and_return('Stormy') 
                expect(subject.take_off(mockPlane)).to eq 'WARNING - Weather is stormy'
            end


        end

    end

end
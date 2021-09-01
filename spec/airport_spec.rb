require 'airport'

describe Airport do
    subject(:airport) { described_class.new(weather, 50) }
    let(:plane) { double :plane, land: nil, take_off: nil }
    let(:weather) { double :weather, stormy?:false }

    describe '#land' do
        before do
            allow(plane).to receive(:land)
        end
    end

    describe 'landing planes' do
        it { is_expected.to respond_to(:land).with(1).argument }
    end
    
    it 'shows plane has landed' do
        airport.land(plane)
        expect(airport.planes).to include plane
    end

    it 'shows plane cannot land when airport at capacity' do
        airport.land(plane)
        message = "Plane cannot land because airport is at capacity"
        expect { airport.land(double :plane).to raise_error message }
    end
    
    describe 'landing planes in stormy weather' do
        it 'raises an error when stormy' do
            allow(weather).to receive(:stormy?).and_return true
            message = 'Planes cannot land during stormy weather'
            expect { airport.land(plane) }.to raise_error message
        end
    end
    
    describe 'landing planes in sunny weather' do
        it 'does not raise an error when sunny' do
            allow(weather).to receive(:stormy?).and_return false
            expect { airport.land(plane) }.not_to_raise_error
        end
    end

    describe '#take_off' do
        before do
            airport.land(plane)
            expect { airport.take_off(plane) }.not_to raise_error
        end
    end
    
    describe 'planes taking off' do
        it 'allows planes to take off' do
            allow(plane).to receive(:take_off)
            subject.take_off plane
        end
        
        it { is_expected.to respond_to(:take_off).with(1).argument }
    end

    it 'shows plane can only take off when it is at airport' do
        message = "Plane is not currently at airport"
        expect { airport.take_off(plane) }.to raise_error message
    end
    
        
    it 'confirms plane has taken off and is no longer at airport' do
        allow(weather).to receive(:stormy?).and_return false
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to include plane
    end
    
    describe '#capacity' do
        it 'will raise error if airport is full' do
            default_airport = Airport.new(weather)
                Airport::DEFAULT_CAPACITY.times do
                    plane = Plane.new
                    default_airport.land(plane)
                end
            expect { default_airport.land(plane) }.to raise_error 'Plane cannot land because airport is at capacity'
        end
    end
    
    context 'defaults' do
        subject(:default_airport) { described_class.new(weather) }
        
        describe '#default_capacity' do
            it 'states airports have a default plane capacity' do
                allow(weather).to receive(:stormy?).and_return false
                described_class::DEFAULT_CAPACITY.times { default_airport.land(plane) }
                expect { default_airport.take_off(plane) }.to raise_error 'Plane cannot land because airport is at capacity'
            end
        end
    end
end

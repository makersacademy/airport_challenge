# This is the file that the spec file goes to check for the airport class
require 'airport'

describe Airport do 
    subject(:airport) { described_class.new(20) }

    # creating a double for the plane class
    let(:plane) { double :plane }
    
    describe '#land' do 
        context 'when not stormy' do
            before do
                allow(airport).to receive(:stormy?).and_return false
            end 

        it 'instructs a plane to land (responds to land method)' do 
            expect(airport).to respond_to(:land).with(1).argument
        end 

        context 'when at capacity/full' do
            it 'does not allow landing and raises an error' do
                20.times do
                    airport.land(plane)
                end 
                expect { airport.land(plane) }.to raise_error "Airport is full, cannot land the plane"
            end 
        end
    end 

        context 'when stormy' do
            it 'raises an error if asked to land a plane' do
                allow(airport).to receive(:stormy?).and_return true
                expect { airport.land(plane) }.to raise_error 'Weather is stormy, cannot land the plane'
            end
        end
    end

    describe '#take_off' do 
        context 'when not stormy' do
            before do
                allow(airport).to receive(:stormy?).and_return false
            end

        it 'instructs a plane to take off' do 
            expect(airport).to respond_to(:take_off).with(1).argument
        end 

        context 'when stormy' do
            before do
                allow(airport).to receive(:stormy?).and_return true
            end

        it 'raises an error if asked to take off a plane' do 
            expect { airport.take_off(plane) }.to raise_error 'Weather is stormy, cannot take off the plane'
        end 

        it 'raises an error if asked to land a plane' do
            expect { airport.land(plane) }.to raise_error 'Weather is stormy, cannot land the plane'
        end
    end
end

end      
end 
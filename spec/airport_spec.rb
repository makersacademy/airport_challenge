require 'airport'

describe Airport do
    subject(:airport) { described_class.new }
    # ? it { is_expected.to respond_to(:land).with(1).argument } Use Later
    it 'instructs a plane to land at the airport safely' do
        expect(airport).to respond_to(:land).with(1).argument
    end

    it 'instructs a plane to take off from the airport safely' do
        expect(airport).to respond_to(:take_off).with(1).argument
    end
    
    # ? it { is_expected.to respond_to(:full?) } Use Later

    it 'raises an error when airport is full' do
        20.times { airport.land(Plane.new) }
        expect { airport.land(Plane.new) }.to raise_error 'Airport Full: Cannot Land'
    end
end
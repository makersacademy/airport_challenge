require 'airport'
require 'plane'

describe Airport do
    subject(:airport) { described_class.new(40) }

    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'forbids landing when at capacity' do
        40.times do
            airport.land(:plane)
        end
        expect { airport.land(:plane) }.to raise_error "Full to capacity: Landing Denied"   
    end
end

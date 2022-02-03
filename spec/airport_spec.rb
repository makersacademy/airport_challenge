require 'airport'

describe Airport do
    let(:airport) { Airport.new }
    let(:plane) { Plane.new }

    it 'prevents landing when full' do
        expect { airport.DEFAULT_CAPACITY.times { airport.prevent_landing_capacity Plane.new } }.to_not raise_error ('airport is full')
    end

    it 'prevents landing when weather is stormy' do
        expect{ airport.prevent_landing_weather plane }.to raise_error("it is stormy")
    end
end


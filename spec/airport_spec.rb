require 'airport.rb'

describe Airport do
    subject(:airport) { described_class.new(15) }
    it 'instructs plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
    end

    it 'instructs plane to takeoff' do
        expect(airport).to respond_to(:takeoff).with(1).argument
    end

    it 'cannot land if airport full' do
        plane = double :plane
        15.times do
            airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'cannot land plane as airport full'
    end
end
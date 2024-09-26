require 'plane'

describe Plane do
    subject(:plane) { described_class.new }
    let(:airport) { double }
    let(:plane) { Plane.new }
    
    it 'is in airport when landed' do
        allow(airport).to receive(:land)
        allow(airport).to receive(:planes).and_return [plane]
        airport.land(plane)
        expect(airport.planes).to include plane
    end
    
    it 'is removed from airport after take off' do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to include plane
    end
        
    it 'cannot take off when already flying' do
        expect { plane.take_off }.to raise_error 'Plane cannot take off when already flying'
    end
    
    it 'cannot be at airport when already flying' do
        expect { plane.airport }.to raise_error 'Plane cannot be at airport when flying'
    end
end
require 'plane'
require 'airport'
require 'weather'

describe Plane do
  let(:airport) { Airport.new }
  let(:weather) { double(:Weather, :stormy? => false) } 

  describe '.planes_flying' do
    context 'if a plane takes off' do
      it 'is added to the @flying array' do
        airport.takeoff(subject, weather)
        expect(subject.planes_flying(subject)).to contain_exactly subject
      end
    end
  end

  describe '.flying?' do
    context 'if a plane takes off' do
      it 'returns true' do
        airport.takeoff(subject, weather)
        subject.planes_flying(subject)
        expect(subject.flying?(subject)).to eq true
      end
    end
  end

  describe '.consistent_flying' do
    context 'given a plane is already flying' do
      it 'cannot take off' do
        airport.takeoff(subject, weather)
        subject.planes_flying(subject)
        subject.flying?(subject)
        expect { subject.edge_flying(subject, airport) }.to raise_error 'Cannot takeoff plane, plane already in flight!'
      end

      it 'cannot be at an airport' do
        airport.takeoff(subject, weather)
        airport.at_airport?(subject, airport)
        expect { subject.edge_flying(subject, airport) }.to raise_error 'Plane not at airport. Plane already in flight!'
      end
    end
  end
end

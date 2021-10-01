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

  describe '.edge_landed' do
    context 'given a plane has already landed' do
      it 'cannot land again' do
        airport.land(subject, weather)
        expect { subject.edge_landed(subject, airport) }.to raise_error 'Plane has landed, cannot land again!'
      end
    end
  end

  describe '.wrong_airport' do
    context 'if plane tries to takeoff from another airport' do
      it 'returns error' do
        airport.land(subject, weather)
        another_airport = Airport.new
        another_airport.takeoff(subject, weather)
        expect { subject.wrong_airport(airport, another_airport) }.to raise_error 'Plane is not in this airport!'
      end
    end
  end
end

require './lib/airport.rb'

describe Airport do
  let (:airport) { subject }
  let (:plane) {Plane.new}

  describe 'Airport should respond to messages' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:takeoff) }
  end
  
  describe 'hangar' do
    it 'should create a hanger for a new Airport' do
      expect(subject.hangar).to eq []
    end

    describe 'capacity' do
      it 'should have a default capacity of 20' do
        expect(subject.capacity).to eq 20
      end

      it 'should have a variable capacity' do
        expect(Airport.new(40).capacity).to eq 40
      end
    end
  end
  
  describe '#land' do
    it 'should add a new plane to the hangar' do
      airport.land(plane)

      expect(airport.hangar.last).to eq plane
    end

    it 'should not land a plane if the Airport is full' do
      airport = Airport.new(30)
      30.times { airport.land(plane) }

      expect { airport.land(Plane.new) }.to raise_error "Airport is full, cannot land plane"
    end
  end

  describe '#takeoff' do
    it 'should remove plane from hangar' do
      airport.land(plane)
      airport.takeoff

      expect(airport.hangar).not_to include plane
    end

    it 'cannot takeoff if there are no planes' do
      expect { airport.takeoff }.to raise_error "No planes to takeoff"
    end
  end  
end


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
  end
  
  describe '#land' do
    it 'should add a new plane to the hangar' do
      airport.land(plane)

      expect(airport.hangar.last).to eq plane
    end

    it 'should not land a plane if the Airport is full' do
      airport.land(plane)

      expect { subject.land(Plane.new) }.to raise_error "Airport is full, cannot land plane"
    end
  end

  describe '#takeoff' do
    it 'should remove plane from hangar' do
      airport.land(plane)
      airport.takeoff
      
      expect(airport.hangar).not_to include plane
    end
  end  
end


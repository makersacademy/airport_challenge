require 'airport'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'raises an error when trying to land a plane that is not flying' do
      plane = double(:plane, flying: false)
      expect { subject.land(plane) }.to raise_error 'Cannot land. Plane has already landed.'
    end

    it 'tells the plane to follow its landing procedures upon landing' do
      plane = double(:plane, flying: true)
      expect(plane).to receive(:landplane)
      subject.land(plane)
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff) }

    it 'raises an error when trying to takeoff a plane that is already flying' do
      plane = double(:plane, flying: true)
      allow(subject).to receive(:badweather?) {false}
      expect { subject.takeoff(plane) }.to raise_error 'Cannot instruct takeoff. Plane is already flying.'
    end

    it 'tells the plane to follow its takeoff procedures upon takeoff' do
      plane = double(:plane, flying: false)
      allow(subject).to receive(:badweather?) {false}
      expect(plane).to receive(:takeoff_plane)
      subject.takeoff(plane)
    end

    it 'raises an error when trying to takeoff in stormy weather' do
      plane = double(:plane, flying: false)
      allow(subject).to receive(:badweather?) { true }
      expect { subject.takeoff(plane) }.to raise_error 'Cannot instruct takeoff. Stormy weather.'
    end

  end


  describe '#planes' do
    it { is_expected.to respond_to(:planes) }

    it 'should return an array with the planes that have landed' do
      planes_array = []
      2.times do
         plane = double(:plane, landplane: false, flying: true)
         planes_array << plane
         subject.land(plane)
      end
      expect(subject.planes).to match_array(planes_array)
    end
  end

end

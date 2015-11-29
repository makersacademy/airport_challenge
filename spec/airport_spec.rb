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

    # it 'allows a plane to leave the airport when it has taken off' do
    #   planes_array = []
    #   2.times do
    #      plane = double(:plane, flying: true)
    #      planes_array << plane
    #      subject.land(plane)
    #   end
    #   subject.takeoff
    #   expect(subject.planes).to match_array(planes_array[0])
    # end
  end

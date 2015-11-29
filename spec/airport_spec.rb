require 'airport'

describe Airport do

  describe '#initialize' do
    it 'sets capacity to argument passed' do
      expect(Airport.new(30).capacity).to eq(30)
    end

    it 'if no argument passed, set\'s capacity to default capacity' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
  end


  context 'behaviour when the weather is fine' do
    describe '#land' do
      it { is_expected.to respond_to(:land).with(2).arguments }

      it 'raises an error when trying to land a plane that is not flying' do
        plane = double(:plane, flying: false)
        weather = double(:weather, change: false, is_stormy: false)
        expect { subject.land(plane, weather) }.to raise_error 'Cannot land. Plane has already landed.'
      end

      it 'raises an error when the airport is full' do
        plane = double(:plane, landplane: false, flying: true)
        weather = double(:weather, change: false, is_stormy: false)
        subject.capacity.times {subject.land(plane, weather)}
        expect { subject.land(plane, weather) }.to raise_error 'Cannot land. Airport is full.'
      end

      it 'tells the plane to follow its landing procedures upon landing' do
        plane = double(:plane, flying: true)
        weather = double(:weather, change: false, is_stormy: false)
        expect(plane).to receive(:landplane)
        subject.land(plane, weather)
      end
    end

    describe '#takeoff' do
      it { is_expected.to respond_to(:takeoff) }

      it 'raises an error when trying to takeoff a plane that is already flying' do
        plane = double(:plane, flying: true)
        weather = double(:weather, change: false, is_stormy: false)
        expect { subject.takeoff(plane, weather) }.to raise_error 'Cannot instruct takeoff. Plane is already flying.'
      end

      it 'tells the plane to follow its takeoff procedures upon takeoff' do
        plane = double(:plane, flying: false)
        weather = double(:weather, change: false, is_stormy: false)
        expect(plane).to receive(:takeoff_plane)
        subject.takeoff(plane, weather)
      end
    end

    describe '#planes' do
      it { is_expected.to respond_to(:planes) }

      it 'should return an array with the planes that have landed' do
        planes_array = []
        plane = double(:plane, landplane: false, flying: true)
        weather = double(:weather, change: false, is_stormy: false)
        2.times do
           planes_array << plane
           subject.land(plane, weather)
        end
        expect(subject.planes).to match_array(planes_array)
      end
    end
  end

  context 'behaviour in stormy weather' do
    describe '#land' do
      it 'raises an error when trying to land a plane in stormy weather' do
        plane = double(:plane, flying: false)
        weather = double(:weather, change: false, is_stormy: true)
        expect { subject.land(plane, weather) }.to raise_error 'Cannot land. Stormy weather.'
      end
    end

    describe '#takeoff' do
      it 'raises an error when trying to takeoff in stormy weather' do
        plane = double(:plane, flying: false)
        weather = double(:weather, change: false, is_stormy: true)
        expect { subject.takeoff(plane, weather) }.to raise_error 'Cannot instruct takeoff. Stormy weather.'
      end
    end
  end

end

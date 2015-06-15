require 'airport'

describe Airport do

  describe 'take off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:instruct_take_off).with(1).argument
    end

    it 'releases a plane when it was the last plane that landed' do
      test_plane = double :plane, landed?: true
      subject.instruct_land test_plane
      subject.instruct_take_off test_plane
      expect(subject.landed_planes).to eq []
    end

    it 'releases specific plane, even if not last to land' do
      test_plane = double :plane, landed?: true
      filler_plane1 = double :plane, landed?: true
      filler_plane2 = double :plane, landed?: true
      subject.instruct_land filler_plane1
      subject.instruct_land test_plane
      subject.instruct_land filler_plane2
      subject.instruct_take_off test_plane
      expect(subject.landed_planes).to eq [filler_plane1, filler_plane2]
    end

    it 'cannot tell a plane to take-off if airport is empty' do
      test_plane = double :plane,landed?: true
      expect { subject.instruct_take_off test_plane }.to raise_error 'No planes to take off'
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:instruct_land).with(1).argument
    end

    it 'receives a plane' do
      test_plane = double :plane, flying?: true
      subject.instruct_land test_plane
      expect(subject.landed_planes).to eq [test_plane]
    end
  end

  describe 'capacity' do
    it 'has a (default) maximum capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'airport has no landed planes when created' do
      expect(subject.landed_planes).to eq []
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        subject.capacity.times {subject.instruct_land double :plane, flying?: true}
        expect { subject.instruct_land double :plane }.to raise_error "Airport is full"
      end
    end

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        allow(subject).to receive(:weather_conditions).and_return('stormy')
        expect { subject.instruct_take_off double :plane }.to raise_error 
        'Planes cannot take off during stormy weather'
      end

      it 'does not allow a plane to land' do
        allow(subject).to receive(:weather_conditions).and_return('stormy')
        expect { subject.instruct_land double :plane }.to raise_error 'Planes cannot land during stormy weather'
      end
    end
  end
end

#Airport



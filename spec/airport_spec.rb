require 'airport'

describe Airport do
  
  it { is_expected.to be_kind_of Airport }

  describe '#land_plane' do
    it 'allows plane to land in airport' do   
      subject.current_weather = 'sunny'
      
      expect(subject.land_plane).to be_kind_of Plane
    end

    it 'does not allow planes to land when airport is full' do
      subject.current_weather = 'sunny'
      subject.capacity.times { subject.land_plane }

      expect { subject.land_plane }.to raise_error('Airport is full')
    end

    it 'does not allow plane to land in airport when stormy' do
      subject.current_weather = 'stormy'

      expect { subject.land_plane }.to raise_error('Cannot fly when there is a storm')
    end
  end

  describe '#take_off' do
    it 'allows plane to leave airport' do
      subject.current_weather = 'sunny'
      plane = Plane.new
      subject.planes_in_airport << plane

      expect(subject.take_off(plane)).to eq plane
    end

    it 'removes plane from airport' do
      subject.current_weather = 'sunny'
      plane = Plane.new
      subject.planes_in_airport = [plane]
      subject.take_off(plane)

      expect(subject.planes_in_airport).to eq([])
    end

    it 'does not let planes take off when stormy' do
      plane = Plane.new
      subject.planes_in_airport = [plane]
      subject.current_weather = 'stormy'

      expect { subject.take_off(plane) }.to raise_error('Cannot fly when there is a storm')
    end
  end

  describe '#def_capacity' do
    it 'allows you to change the capacity of the airport' do
      subject.def_capacity(20)
      
      expect(subject.capacity).to eq(20)
    end
  end

  describe '#check_weather' do
    it 'reports what if the weather is sunny or stormy' do
      expect(subject.check_weather).to eq('sunny').or eq('stormy')
    end
  end
end

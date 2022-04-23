 require 'airport'

 describe Airport do
   
  it { is_expected.to be_kind_of Airport }

  describe '#land_plane' do
    it 'allows plane to land in airport' do   
      expect(subject.land_plane).to be_kind_of Plane
    end

    it 'does not allow planes to land when airport is full' do
      subject.capacity.times { subject.land_plane }

      expect{subject.land_plane}.to raise_error
    end
  end

  describe '#take_off' do
    it 'allows plane to leave airport' do
      plane = Plane.new
      subject.planes_in_airport << plane

      expect(subject.take_off(plane)).to eq plane
    end

    it 'removes plane from airport' do
      plane = Plane.new
      subject.planes_in_airport = [plane]
      subject.take_off(plane)

      expect(subject.planes_in_airport).to eq([])
    end


  end

  describe '#set_capacity' do
    it 'allows you to change the capacity of the airport' do
      subject.set_capacity(20)
      
      expect(subject.capacity).to eq(20)
    end
  end

  describe '#check_weather' do
    it 'reports what if the weather is sunny or stormy' do
      expect(subject.current_weather).to eq('sunny').or eq('stormy')
    end
  end

 end
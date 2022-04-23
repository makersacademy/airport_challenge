 require 'airport'

 describe Airport do
   
  it { is_expected.to be_kind_of Airport }

  describe '#land_plane' do
    it 'allows plane to land in airport' do   
      expect(subject.land_plane).to be_kind_of Plane
    end
  end

  describe '#take_off' do
    it 'allows plane to leave airport' do
      plane = Plane.new
      subject.planes_in_airport = plane

      expect(subject.take_off(plane)).to eq plane
    end
    it 'removes plane from airport' do
      subject.land_plane
      subject.take_off(subject.planes_in_airport)

      expect(subject.planes_in_airport).to eq(nil)
    end
  end

 end
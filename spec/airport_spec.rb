 require 'airport'

 describe Airport do
   
  it { is_expected.to be_kind_of Airport }

  describe '#land_plane' do
    it 'allows plane to land in airport' do   
      expect(subject.land_plane).to be_kind_of Plane
    end

  end

 end
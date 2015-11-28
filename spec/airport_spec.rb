require 'airport'

describe Airport do
  describe '#land_plane' do
    it {is_expected.to respond_to :land_plane}

    it 'expects landed planes to be landed' do
      plane = subject.land_plane
      expect(plane).to be_landed
    end


  end

end

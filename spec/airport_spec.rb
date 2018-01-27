require "airport"

describe Airport do
  let(:plane) {:plane}

  describe '#land_plane' do

      it 'should take a plane and add it to the hangar' do
        expect(subject.land_plane(plane)).to eq [plane]
      end

  end

  describe '#take_off_plane' do

    it 'should take off a plane and remove it from hangar' do
      subject.land_plane(plane)
      expect(subject.take_off_plane(plane)).to eq plane
    end
  end

end

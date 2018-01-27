require "airport"
require "plane"
describe Airport do
  let(:plane) {:plane}

  describe '#land_plane' do

      it 'should take a plane and add it to the hangar' do
        expect(subject.land_plane(plane)).to eq [plane]
      end

  end

end

require "airport"
require "plane"
describe Airport do

  describe '#land_plane' do

      it 'should take a plane and return it' do
        plane = Plane.new
        expect(subject.land_plane(plane)).to eq plane
      end

  end

end

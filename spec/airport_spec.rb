require 'airport'
require 'plane'

describe Airport do
  describe '#plane_lands' do
    it 'shows plane that has landed' do
      plane = Plane.new
      subject.plane_lands(plane)
      expect(subject.planes.last).to eq plane
    end
  end
end

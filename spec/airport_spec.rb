require 'airport'
require 'plane'

describe Airport do

  context 'landing a plane' do

    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq("Plane safely landed")
    end

  end

end

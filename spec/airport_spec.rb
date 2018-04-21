require 'airport'
require 'plane'

describe Airport do
  describe '#plane_lands' do
    it 'shows plane in airport once it has landed' do
      plane = Plane.new
      subject.plane_lands(plane)
      expect(subject.planes.last).to eq plane
    end
  end
end

describe Airport do
  describe '#plane_takes_off' do
    it 'shows plane no longer in airport once it has taken off' do
      plane = Plane.new
      subject.plane_takes_off(plane)
      expect(subject.planes.include?(plane)).to eq false
    end
  end
end

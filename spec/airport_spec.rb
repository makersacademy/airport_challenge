require 'airport'

describe Airport do
  describe '#can_land?' do
    it 'can tell a plane if it can land' do
      expect(subject.can_land?).to be true
    end
  end
  describe '#can_takeoff?' do
    it 'can tell a plane if it can take off' do
      expect(subject.can_takeoff?).to be true
    end
  end
  describe '#landing' do
    it 'adds the plane to the list of planes in airport' do

    end
  end
end

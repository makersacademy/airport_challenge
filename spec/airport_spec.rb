require 'airport'

describe Airport do

  subject { described_class.new }
  let(:plane) { Plane.new }

  describe '#allow_to_land' do
    it 'lands a plane in an airport' do
      expect(subject.allow_to_land(plane)).to eq([plane])
    end
  end

  describe '#planes' do
    it 'shows me if a plane is inside of an airport' do
      subject.allow_to_land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  describe '#take_off' do
    it 'plane is removed from the airport' do
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end

end

require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to :hangar }

  describe '#initialize' do
    it 'has a hangar when an airport is created' do
      expect(subject.hangar).to eq([])
    end
  end

  describe '#full?' do
    it 'returns true when hangar contains CAPACITY planes' do
      subject.capacity.times { Plane.new.land(subject) }
      expect(subject.full?).to eq(true)
    end
  end
end

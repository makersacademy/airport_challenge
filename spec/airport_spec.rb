require 'airport'
require 'plane'

describe Airport do

  let(:plane) { Plane.new }

  describe '#land' do
    it 'lands a plane' do
      expect(subject.land(plane)).to include plane
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'instructs a plane to take off' do
      expect(subject.take_off).to_not include plane
    end
  end
end

require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#landed?' do
    it 'allows a plane to land' do
      expect(subject).to respond_to :landed?
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      expect(subject).to respond_to :take_off?
    end
  end
end

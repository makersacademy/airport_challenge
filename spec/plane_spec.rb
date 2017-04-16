require 'plane'

RSpec.describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to :landed }
  it { is_expected.to respond_to :taken_off }

  describe '#landed' do
    it 'confirms that it has landed' do
      expect(plane.landed).to eq "Landed"
    end
  end

  describe '#taken_off' do
    it 'confirms that it has taken off' do
      expect(plane.taken_off).to eq "Taken off"
    end
  end

end

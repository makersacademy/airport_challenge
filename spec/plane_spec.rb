require 'plane'

RSpec.describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to :landed? }

  describe '#landed?' do
    it 'confirms that it has landed' do
      expect(plane.landed?).to eq "Landed"
    end
  end

end

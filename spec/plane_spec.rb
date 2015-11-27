require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to(:status) }
  it { is_expected.to respond_to(:land) }

  describe '#status' do

    it 'is expected to respond with flying upon Plane initialization' do
      expect(plane.status).to eq(:flying)
    end

  end

end

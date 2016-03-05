require 'airport'

describe Airport do
  subject(:airport) { described_class.new}
  let(:plane) { double :plane }

  describe '#arriving' do
    it { is_expected.to respond_to(:arriving)}

    it 'instructs a plane to land' do
      expect(airport.arriving(plane)).to eq true
    end
  end

  describe '#landed?' do

  end
end

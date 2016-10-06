require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  describe '#land' do
    it 'returns message if plane has landed' do
      expect(plane.land).to eq 'Landed'
    end
  end

  describe '#take_off' do
    it 'returns message if plane took off' do
      expect(plane.take_off).to eq 'Departed'
    end
  end
end

require 'airport'

describe Airport do

  it {is_expected.to respond_to(:land).with(1).argument}

  let(:plane) {double(:plane)}

  describe '#land' do
    it 'allows planes to land' do
      expect(subject.land plane).to eq plane
    end
  end
end

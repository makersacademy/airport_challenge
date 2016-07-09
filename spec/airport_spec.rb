require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:planes)}

  let(:plane) {double(:plane)}

  describe '#land' do
    it 'planes enter the airport when they land' do
      subject.land plane
      expect(subject.planes).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'planes leave the airport after takeoff' do
      subject.take_off plane
      expect(subject.planes).to eq []
    end
  end
end

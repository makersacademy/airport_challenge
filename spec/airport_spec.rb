require 'airport'

describe Airport do


  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:planes)}

  let(:plane) {double(:plane)}
  let(:subject) {Airport.new}

  describe '#initialize' do
  end

  describe '#land' do
    it 'planes enter the airport when they land' do
      allow(plane).to receive(:land)
      subject.land plane
      expect(subject.planes).to eq [plane]
    end
    it 'planes cannot land if airport is full' do
      allow(plane).to receive(:land)
      3.times {subject.land(plane)}
      expect{subject.land plane}.to raise_error 'Airport Full'
    end
  end

  describe '#take_off' do
    it 'planes leave the airport after takeoff' do
      allow(plane).to receive(:take_off)
      subject.take_off plane
      expect(subject.planes).to eq []
    end
  end

end

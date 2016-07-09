require 'airport'

describe Airport do


  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:hanger)}

  let(:plane) {double(:plane)}
  let(:subject) {Airport.new}

  describe '#initialize' do
    it 'has a variable capacity' do
      allow(plane).to receive(:down)
      subject = Airport.new(20)
      20.times { subject.land(plane) }
      expect{subject.land plane}.to raise_error 'Airport Full'
    end
    it 'has a default capacity' do
      allow(plane).to receive(:down)
      described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect{subject.land plane}.to raise_error 'Airport Full'
    end
  end

  describe '#land' do
    it 'planes enter the airport when they land' do
      allow(plane).to receive(:down)
      subject.land plane
      expect(subject.hanger).to eq [plane]
    end
    it 'planes cannot land if airport is full' do
      allow(plane).to receive(:down)
      3.times {subject.land(plane)}
      expect{subject.land plane}.to raise_error 'Airport Full'
    end
  end

  describe '#take_off' do
    it 'planes leave the airport after takeoff' do
      allow(plane).to receive(:up)
      subject.take_off plane
      expect(subject.hanger).to eq []
    end
  end

end

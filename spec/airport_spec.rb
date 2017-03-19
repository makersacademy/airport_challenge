require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) { double :plane}

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land(plane)' do
    it 'signals a plane to land' do
      plane = double :plane
      allow(plane).to receive(:land)
      subject.land(plane)
    end
    it 'holds planes after landing' do
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.land(plane)).to include plane
    end
  end

  describe '#take_off' do
    it 'takes-off planes' do
      plane = double :plane
      allow(plane).to receive(:take_off)
      subject.take_off
      expect(subject.take_off).to be_left
    end
    it 'does not allow take-off in storms' do
      weather = double :weather
      allow(weather).to receive(:stormy?).and_return(true)
      message = 'Stormy weather'
      expect{subject.take_off}.to raise_error message
  end
end
end

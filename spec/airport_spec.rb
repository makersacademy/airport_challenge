require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }
  it { is_expected.to respond_to :in_airport? }

  let(:plane) { Plane.new }
  let(:weather) { double("Weather") }
  let(:airport) { double("Airport") }

  describe '#land' do
    it 'adds plane to docked planes' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'raises error when stormy' do
      allow(subject.weather).to receive(:stormy?).and_return(true)
      message = 'cannot land in stormy weather'
      expect { subject.land(plane) }.to raise_error message
    end
  end

  describe '#takeoff' do
    it 'removes plane from docked planes' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).not_to include plane
    end

    it 'raises error when stormy' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      allow(subject.weather).to receive(:stormy?).and_return(true)
      message = 'cannot takeoff in stormy weather'
      expect { subject.takeoff(plane) }.to raise_error message
    end
  end

  describe '#in_airport?' do
    it 'returns true when plane is docked' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.in_airport?(plane)).to eq true
    end

    it 'returns false when plane is not in airport' do
      expect(subject.in_airport?(plane)).to eq false
    end
  end
end

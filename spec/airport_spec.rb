require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#landing' do
    it 'allows a plane to land at the airport' do
      allow(subject).to receive(:weather_condition).and_return ("sunny")
      expect(subject.landing(plane)).to eq [plane]
    end

    it 'if plane wants to land, raises an error if airport is full' do
      allow(subject).to receive(:full?).and_return true
      expect{subject.landing Plane.new}.to raise_error 'airport is full'
    end
    it 'if plane wants to land, raises an error if weather is stormy' do
      allow(subject).to receive(:empty?).and_return false
        allow(subject).to receive(:weather_condition).and_return "stormy" 
        expect{subject.landing Plane.new}.to raise_error 'cant land due to storm'
    end
  end

  describe '#departing' do
    it 'plane departs from an airport' do
        allow(subject).to receive(:weather_condition).and_return ("sunny")
        subject.landing(plane)
        expect(subject.departing).to eq plane
    end

    it 'if plane is departing, raises an error if weather is stormy' do
      allow(subject).to receive(:empty?).and_return false
        allow(subject).to receive(:weather_condition).and_return "stormy" 
        expect{subject.departing}.to raise_error 'cant fly due to storm'
    end

    it 'raises an error if no planes are at airport to depart' do
      allow(subject).to receive(:empty?).and_return true
      expect { subject.departing }.to raise_error 'no planes at the airport'
    end
  end

  it 'allows airport to have default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
   

  it 'returns the landed plane' do
      expect(subject).to respond_to (:plane)
  end
    
end

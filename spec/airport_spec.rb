require 'airport'

describe Airport do

  let(:plane) { double :plane }
  it 'holds custom capacities' do
    airport = Airport.new(50)
    allow(airport).to receive(:stormy?).and_return false
    expect { 50.times { airport.land double :plane } }.not_to raise_error
  end

  context 'when it is sunny' do
    before do
      allow(subject).to receive(:stormy?).and_return false
    end
    
    it 'holds the plane after landing' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.hanger).to include plane
    end

    it 'landing raises an error when hanger is full' do
      subject.capacity.times { subject.land double :plane }
      expect { subject.land double(:plane) }.to raise_error 'Hanger is full'
    end

    it 'lets planes take off' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.take_off(plane)).to eq(plane)
    end
  end

  context 'when it is stormy' do
    before do
      allow(subject).to receive(:stormy?).and_return true
    end

    it 'raises an error on take_off' do
      plane = double(:plane)
      expect { subject.take_off(plane) }.to raise_error 'Weather is stormy'
    end

    it 'raises an error on landing' do
      plane = double(:plane)
      expect { subject.land(plane) }.to raise_error 'Weather is stormy'
    end
  end
end

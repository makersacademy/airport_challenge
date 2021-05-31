require 'airport'

describe Airport do
  let(:plane) { double :plane }
  let(:weather) { double :weather }
  let(:airport) { double :airport }
  it 'default number of planes set to 5' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'default capacity can be manually set' do 
    expect(Airport.new(10).capacity).to eq 10
  end
  it 'airport is full' do
    allow(airport).to receive(:airport_full?).and_return true
  end
  it 'airport is empty' do
    allow(airport).to receive(:airport_empty?).and_return false
  end

  describe '#land' do
    context 'when not stormy' do
      before do 
        allow(subject).to receive(:stormy?) { false }
      end
      it 'Plane landing when in the airport' do 
        subject.land(plane)
        expect(subject.planes).to eq [plane]
      end
    end

    context 'when stormy' do
      before do 
        allow(subject).to receive(:stormy?) { 1 }
      end
      it 'Plane unable to land' do
        expect { subject.land(plane) }.to raise_error 'Unable to land. Weather is stormy'
      end
    end
  end

  describe '#take_off' do
    context 'not stormy' do
      before do 
        allow(subject).to receive(:stormy?) { false }
      end
      it 'Plane takes off' do
        subject.land(plane)
        expect(subject.take_off).to eq plane
      end
    end
  end

  context 'stormy' do
    before do 
      allow(subject).to receive(:stormy?) { true }
    end
    it 'Plane unable to take off due to storms' do
      expect { subject.take_off }.to raise_error 'Weather is stormy. Cannot take off'
    end
  end
end

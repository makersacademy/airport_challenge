require 'airport'

describe Airport do
  let(:plane) { double :plane }

  let(:weather) { double :weather, stormy?: stormy }
  let(:stormy) { false }
  before { allow(Weather).to receive(:new).and_return(weather) }

  it 'new instances of airport start empty' do
    expect(subject.planes).to eq []
  end

  describe '#land', :land do
    it 'returns an array containing a plane' do
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#take_off', :take_off do
    before { subject.land(plane) }

    context 'when the weather is clear' do
      let(:stormy) { false }

      it 'does not raise an error' do
        expect { subject.take_off(plane) }.to_not raise_error
      end

      it 'removes plane from airport' do
        subject.take_off(plane)
        expect(subject.planes).to eq []
      end

      it 'returns the status of the plane' do
        expect(subject.take_off(plane)).to eq 'This plane has left the airport'
      end
    end

    context 'when the weather is stormy' do
      let(:stormy) { true }

      it 'denies take off' do
        expect { subject.take_off(plane) }.to raise_error 'The weather does not permit take off'
      end
    end
  end
end

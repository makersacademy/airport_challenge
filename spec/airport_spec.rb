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

    it 'raises an error if trying to land a landed plane' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'This plane has already landed'
    end

    context 'when the weather is stormy' do
      let(:stormy) { true }

      it 'raises an error when trying to land a plane' do
        expect { subject.land(plane) }.to raise_error 'The weather does not permit landing'
      end
    end
  end

  describe '#take_off', :take_off do
    before { subject.planes == [plane] }

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

  describe '#plane_in_airport?', :plane_in_airport do
    context 'when plane is landed' do
      before { subject.land(plane) }

      it 'returns true' do
        expect(subject.plane_in_airport?(plane)).to eq true
      end
    end

    context 'when plane is not landed' do
      before do
        subject.land(plane)
        subject.take_off(plane)
      end

      it 'returns false' do
        expect(subject.plane_in_airport?(plane)).to eq false
      end
    end

  end
end

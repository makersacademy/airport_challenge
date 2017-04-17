require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let (:plane) {double :plane}
  let (:Weather) {double :Weather}


  describe 'initialize airport' do

    it 'has a default capacity' do
        expect(subject.capacity).to eq(5)
    end

    it 'can store planes' do
      expect(subject.planes).to eq([])
    end
  end


  describe 'landing a plane' do

    before do
      allow(plane).to receive(:land)
      allow(Weather).to receive(:stormy?).and_return(false)
    end

    it 'instructs the plane to land' do
      expect(plane).to receive(:land)
      subject.land(plane)
    end

    it 'has the plane after landing' do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'fails when the airport is full' do
      subject.capacity.times {subject.land(plane)}
      error = 'Cannot land as the airport is full'
      expect {subject.land(plane)}.to raise_error error
    end

    it 'returns itself' do
      expect(subject.land(plane)).to eq(subject)
    end

  end


  describe 'plane take-off' do
    before do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(Weather).to receive(:stormy?).and_return(false)
      subject.land(plane)
    end

    it 'instructs the plane to take off' do
      expect(plane).to receive(:take_off)
      subject.take_off(plane)
    end

    it 'no longer has the plane after take-off' do
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'fails when the plane is not in the airport' do
      subject.take_off(plane)
      error = 'Cannot take off: the plane is not in the airport'
      expect {subject.take_off(plane)}.to raise_error error
    end

    it 'returns the plane' do
      expect(subject.take_off(plane)).to eq(plane)
    end

  end

  context 'the weather is stormy' do
      before do
        allow(plane).to receive(:land)
        allow(plane).to receive(:take_off)
        allow(Weather).to receive(:stormy?).and_return(false)
      end

      it 'does not allow plane to land' do
        allow(Weather).to receive(:stormy?).and_return(true)
        error = 'Cannot complete command, the weather is too stormy'
        expect{subject.land(plane)}.to raise_error error
      end

      it 'does not allow plane to take off' do

        subject.land(plane)
        allow(Weather).to receive(:stormy?).and_return(true)
        error = 'Cannot complete command, the weather is too stormy'
        expect{subject.take_off(plane)}.to raise_error error
      end
  end



end

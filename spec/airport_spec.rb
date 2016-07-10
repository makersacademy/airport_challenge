require 'airport'

describe Airport do

  describe '#accept' do

    let(:plane) { double :plane, land: true, landed?: true }
    before do
      allow(subject.weather).to receive(:stormy?) { false }
    end
    it 'accepts an plane' do
      subject.accept(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'does not accept a plane if it is already in the airport' do
      subject.accept(plane)
      expect{ subject.accept(plane) }.
        to raise_error 'This plane has already landed here'
    end

    it 'does not allow the plane to land if the weather is stormy' do
      allow(subject.weather).to receive(:stormy?) { true }
      expect { subject.accept(plane) }.
        to raise_error 'Could not land because of stormy weather'
    end

  end

  describe '#take_off' do

    let(:plane) { double :plane, land: true, landed?: false, take_off: true}
    before do
      allow(subject.weather).to receive(:stormy?) { false }
      subject.accept(plane)
    end

    it 'takes off a plane' do
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

    it 'does not allow to take off if the plane is not there' do
      subject.take_off(plane)
      expect{ subject.take_off(plane) }.
        to raise_error 'This plane was not found in the airport'
    end

    it 'does not allow the plane to take off if the weather is stormy' do
      allow(subject.weather).to receive(:stormy?) { true }
      expect{ subject.take_off(plane) }.
        to raise_error 'Could not take off because of stormy weather'
    end

  end

  describe '#weather' do

    # Airport.weather keeps track of the weather
    it { is_expected.to respond_to :weather }
    it 'should return the weather class' do
      expect(subject.weather).to be_a(Weather)
    end

  end

end

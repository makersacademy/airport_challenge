require 'airport.rb'

describe Airport do
  let(:plane1) { double 'Plane1' }
  let(:plane2) { double 'Plane2' }

  context '#instructing planes to land' do
    it 'lands one plane' do
      subject.land(plane1)
      expect(subject.hangar.first).to eq plane1
    end
  end

  context '#instructing planes to take off' do
    it 'raises error when no planes in airport' do
      expect{ subject.take_off plane1 }.to raise_error 'No planes in airport'
    end

    it 'raises error when requested plane not available' do
      subject.land(plane1)
      expect{ subject.take_off plane2 }.to raise_error 'Plane not in airport'
    end

    it 'returns plane when available' do
      subject.land(plane1)
      subject.land(plane2)
      expect(subject.take_off plane1).to eq plane1
      expect(subject.take_off plane2).to eq plane2
    end
  end

end

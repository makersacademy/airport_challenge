require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) {double(:plane)}
  context 'when a plane is landing' do
    it 'can confirm that 1 plane has landed' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.confirm_land(plane)
      expect(subject.planes.count).to eq 1
    end

    it 'can confirm that a plane has landed and is in it\'s slot' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.confirm_land(plane)).to eq subject.planes[-1]
    end

    it 'raises an error if weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect{ subject.confirm_land(plane) }.to raise_error "Plane cannot land, it is too stormy."
    end

    it 'raises an error if airport is at capacity' do
      allow(subject).to receive(:stormy?).and_return(false)
      20.times {subject.confirm_land(plane) }
      expect{ subject.confirm_land(plane) }.to raise_error "Plane cannot land as airport is at capacity."
    end
  end

  context 'when a plane is taking off' do
    it 'can confirm that 1 plane has taken off' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.confirm_land(plane)
      expect( subject.confirm_takeoff(plane) ). to eq subject.planes
    end

    it 'raises an error if weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.confirm_land(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      expect{ subject.confirm_takeoff(plane) }.to raise_error "Plane cannot take off, it is too stormy."
    end

    it 'raises an error when the airport is empty' do
      expect{ subject.confirm_takeoff(:plane) }.to raise_error "There are no planes in airport."
    end
  end

end

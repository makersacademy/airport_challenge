require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe "#initialize" do
    it 'defaults capacity' do
      expect( subject.capacity ).to eq Airport::DEFAULT_CAPACITY
    end

    it 'overrides default capacity at initialization' do
      n = (0..1000)
      airport = Airport.new(n)
      expect( airport.capacity ).to eq n
    end
  end

  describe '#land' do
    it 'allows planes to land' do
      expect(subject.land(plane)).to eq [plane]
    end

    it 'does not allow landed planes to land again' do
      subject.land(plane)
      expect{ subject.land(plane) }.to raise_error "This plane has already landed"
    end

    it 'has the plane after landing' do
      subject.land(plane)
      expect(subject.landing_strip).to include plane
    end

    it 'raises error if airport is full' do
      (0..subject.capacity).each {|x| subject.landing_strip << x}
      expect{ subject.land(plane) }.to raise_error "The airport is full. You must land somewhere else"
    end

    it 'raises error if weather is too stormy for landing' do
      allow(subject.weather).to receive(:stormy?) {true}
      expect{ subject.land(plane) }.to raise_error "The weather is too stormy. You cannot land now."
    end

  end

  describe "#take_off" do
    it 'allows planes to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'does not allow airborne planes to take off again' do
      subject.land(:another_plane)
      expect{ subject.take_off(plane)}.to raise_error "This plane is already airborne"
    end

    it 'does not have the plane after take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.landing_strip).not_to include plane
    end

    it 'raises error if airport is empty' do
      expect{ subject.take_off(plane)}.to raise_error "There are no planes here"
    end
  end

end

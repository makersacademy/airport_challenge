require "airport"

describe Airport do

  describe '#landing' do
    let(:plane) {double :plane, landing: true, flying: true}
    it '-prevents airplanes landing when full' do
      subject.stormy = false
      allow(plane).to receive(:landed).and_return(false)
      subject.land(plane)
      expect{ subject.land(plane) }.to raise_error("airport is at capacity")
    end

    # it '-changes a planes status to not flying'
    #   expect(subject.)
  end

  describe '#storm'do
    let(:plane) {double :plane, landing: true, flying: true}
    it 'does not dock planes when stormy' do
      subject.stormy = true
      expect{ subject.land(plane) }.to raise_error("cannot land when stormy")
    end
  end

  describe '#airport_take_off' do
    let(:plane) {double :plane, landing: true, flying: true, id: 'peanut butter'}
    it 'lets the same plane take off' do
      subject.stormy = false
      allow(plane).to receive(:landed).and_return(false)
      allow(plane).to receive(:take_off).and_return(true)
      subject.land(plane)
      expect(subject.airport_take_off).to eq plane
    end

    it 'checks a plane has left' do
      expect(subject.planes).to eq([])
    end
  end

  describe '#airport capacity' do
    it 'allows change of the default capacity' do
      subject.capacity = 20
      expect( subject.capacity ).to eq 20
    end
  end

  describe '#landing permissions' do

    let(:plane) {double :plane, landing: false, flying: true}
    it '-prevents a flying plane landing without permission' do
      subject.stormy = false
      expect{ subject.land(plane)}.to raise_error("cannot land a flying plane without permission")
    end

    let(:plane2) {double :plane, landing: true, flying: false}
    it '-prevents a non-flying plane from landing' do
      subject.stormy = false
      expect{ subject.land(plane2)}.to raise_error("cannot land a plane that is not flying")
    end
  end

end

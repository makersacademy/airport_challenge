require 'airport'

class MockPlane
  attr_reader :status

  def initialize
    @status = 'grounded'
  end

  def grounded?
    @status == 'grounded'
  end

  def flying?
    @status == 'flying'
  end

  def land
    @status = 'grounded'
  end

  def take_off
    @status = 'flying'
  end
end

describe Airport do

  let(:plane) { MockPlane.new }
  let(:flying_plane) {
    plane2 = MockPlane.new
    plane2.take_off
    plane2
  }
  let(:airport) {
    a = Airport.new
    a.planes << plane
    a
  }

  describe '#land' do
    it { expect{ airport.land(flying_plane) }.to change { airport.planes.include?(flying_plane) } }
    it { expect{ airport.land(flying_plane) }.to change { flying_plane.status } }
    it { expect{ airport.land(plane) }.to raise_error 'Plane Already Grounded' }
    it 'raises an error when airport is full' do
      airport.planes << plane until airport.full?
      expect{ airport.land(flying_plane) }.to raise_error 'Airport Full'
    end

    context 'when airport is stormy' do
      it 'raises an error' do
        airport.weather = 'stormy'
        expect{ airport.land(flying_plane) }.to raise_error 'Unable to Land Due to Stormy Weather'
      end
    end
  end

  describe '#take_off' do
    it 'no longer has the plane at airport' do
      expect{ airport.take_off(plane) }.to change { airport.planes.include?(plane) }
    end
    it 'the planes status is changed to flying' do
      expect{ airport.take_off(plane) }.to change { plane.status }
    end
    it { expect{ airport.take_off(flying_plane) }.to raise_error 'Plane Already Flying' }
    it { expect{ subject.take_off(plane) }.to raise_error 'Plane Not At This Airport' }
    context 'when airport is stormy' do
      it 'raises an error' do
        airport.weather = 'stormy'
        expect{ airport.take_off(plane) }.to raise_error 'Unable to Take Off Due to Stormy Weather'
      end
    end
  end

  describe '@capacity' do
    it { expect(Airport.new.capacity).to eq(Airport::DEFAULT_CAPACITY) }
    it { expect(Airport.new(5).capacity).to eq(5) }
  end

  describe '@weather' do
    it { expect(airport.weather).to eq('sunny').or eq('stormy') }
  end

  describe '#sunny?' do
    it { expect(airport.sunny?).to be(true).or be(false) }

    it 'returns opposite of stormy?' do
      expect(airport.sunny?).not_to be(airport.stormy?)
    end
  end

  describe '#stormy?' do
    it { expect(airport.stormy?).to be(true).or be(false) }
    it 'returns opposite of sunny?' do
      expect(airport.stormy?).not_to be(airport.sunny?)
    end
  end

  describe '@planes' do
    it { expect(airport.planes).to be_a(Array) }
  end

  describe '#full?' do
    it { expect(airport.full?).to be(true).or be(false) }
    context 'when airport is up to capacity' do
      it 'returns true' do
        airport.planes << plane until airport.full?
        expect(airport.full?).to be(true)
      end
    end
  end

  describe '#empty?' do
    it { expect(airport.empty?).to be(true).or be(false) }
    context 'when airport is empty' do
      it 'returns true' do
        expect(subject.empty?).to be(true)
      end
    end
  end

end

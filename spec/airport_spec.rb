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
    plane.take_off
    plane
  }

  describe '#land' do
    it { expect{ subject.land(flying_plane) }.to change { subject.planes.include?(flying_plane) } }
    it { expect{ subject.land(flying_plane) }.to change { flying_plane.status } }
    it { expect{ subject.land(plane) }.to raise_error 'Plane Already Grounded' }
    it 'raises an error when airport is full' do
      subject.capacity.times { subject.planes << plane }
      expect{ subject.land(flying_plane) }.to raise_error 'Airport Full'
    end
  end

  describe '#take_off' do
    it 'no longer has the plane at airport' do
      subject.planes << plane
      expect{ subject.take_off(plane) }.to change { subject.planes.include?(plane) }
    end
    it 'the planes status is changed to flying' do
      subject.planes << plane
      expect{ subject.take_off(plane) }.to change { plane.status }
    end
    it { expect{ subject.take_off(flying_plane) }.to raise_error 'Plane Already Flying' }
    it { expect{ subject.take_off(plane) }.to raise_error 'Plane Not At This Airport' }
  end

  describe '@capacity' do
    it { expect(Airport.new.capacity).to eq(Airport::DEFAULT_CAPACITY) }
    it { expect(Airport.new(5).capacity).to eq(5) }
  end

  describe '@weather' do
    it { expect(subject.weather).to eq('sunny').or eq('stormy') }
  end

  describe '#sunny?' do
    it { expect(subject.sunny?).to be(true).or be(false) }

    it 'returns opposite of stormy?' do
      expect(subject.sunny?).not_to be(subject.stormy?)
    end

    it 'returns true or false based on @weather' do
      if subject.sunny?
        expect(subject.sunny?).to be(true)
      else
        expect(subject.sunny?).to be(false)
      end
    end
  end

  describe '#stormy?' do
    it { expect(subject.stormy?).to be(true).or be(false) }
    it 'returns opposite of sunny?' do
      expect(subject.stormy?).not_to be(subject.sunny?)
    end
  end

  describe '@planes' do
    it { expect(subject.planes).to be_a(Array) }
  end

  describe '#full?' do
    it { expect(subject.full?).to be(true).or be(false) }
    it { expect(subject.full?).not_to be(subject.empty?) }
    context 'when airport is up to capacity' do
      it 'returns true' do
        subject.capacity.times { subject.planes << plane }
        expect(subject.full?).to be(subject.planes.count == subject.capacity)
      end
    end
  end

  describe '#empty?' do
    it { expect(subject.empty?).to be(true).or be(false) }
    it { expect(subject.empty?).not_to be(subject.full?) }
    context 'when airport is empty' do
      it 'returns true' do
        expect(subject.empty?).to be(subject.planes.count <= 0)
      end
    end
  end

end

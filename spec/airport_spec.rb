require 'airport'

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) { double :plane}

  it{is_expected.to respond_to(:stormy?)}

  describe 'capacity' do
    it 'has default capacity on initialize' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
    it 'can be overriden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new(random_capacity)
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe 'plane_land' do
    it 'has landed plane' do
      subject.plane_land(plane)
      expect(subject.planes).to eq([plane])
    end

  end

  describe 'plane_take_off' do
    it 'no longer has plane' do
      subject.plane_land(plane)
      subject.plane_take_off(plane)
      expect(subject.planes).to be_empty
    end
  end

end

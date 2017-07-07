require 'airport'

describe Airport do

  describe 'capacity' do
    it 'can be overridden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end

    it 'has a default capacity when initilized' do
      expect(subject.capacity).to eq Airport::CAPACITY
    end
  end

  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to(:land).with(1).argument }

  describe 'land' do
    it 'lands a plane' do
      subject.land double :plane
      expect(subject).not_to be_empty
    end

    it 'raises error when over capacity' do
      subject.capacity.times { subject.land double(:plane) }
      expect { subject.land double(:plane) }.to raise_error "#{described_class.name} full"
    end
  end
end

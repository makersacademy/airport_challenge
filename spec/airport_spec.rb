require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane)       { double :plane}

  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:land_plane) }
  it { is_expected.to respond_to(:take_off) }

  describe '#initialize' do
    it 'starts with an empty airport' do
      expect(subject.planes).to eq []
    end
  end

  describe '#land_plane' do
    before(:example) do
      subject.land_plane(plane)
    end

    it 'confirms a plane has landed' do
      expect(subject.planes.include?(plane)).to eq true
    end
  end

  describe '#take_off' do
    before(:example) do
      subject.planes << plane
      subject.take_off(plane)
    end

    it 'confirms that a plane taken off' do
      expect(subject.planes.include?(plane)).to eq false
    end
  end
end

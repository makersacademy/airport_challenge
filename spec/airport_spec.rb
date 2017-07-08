require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane)   { double :plane}

  it { is_expected.to respond_to(:land_plane) }
  it { is_expected.to respond_to(:planes) }

  describe '#initialize' do
    it 'starts with an empty airport' do
      expect(subject.planes).to eq []
    end
  end

  describe '#has_landed?' do
    before(:example) do
      subject.land_plane(plane)
    end

    it 'confirms a plane has landed' do
      expect(subject.has_landed?(plane)).to eq true
    end
  end
end

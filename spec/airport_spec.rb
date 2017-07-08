require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'instructs a plane to land' do
      expect(plane).to receive(:land)
      subject.land plane
    end

    it 'contains the landed plane' do

    end
  end

end

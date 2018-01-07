require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'responds to land' do
      expect(airport).to respond_to :land
    end

    it 'airport has plane after landing' do
      airport.land(plane)
      expect(airport.hangar).to include plane
    end
  end

end

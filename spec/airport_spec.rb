require 'airport'

describe Airport do
  let(:airport) {described_class.new}
  let(:plane) {double(:plane)}

  describe '#stored_planes' do

    it 'is an empty array by default' do
      expect(airport.stored_planes).to be_empty
    end
  end
end

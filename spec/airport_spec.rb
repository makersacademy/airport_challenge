require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double(:plane)}

  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:planes)}

  describe 'creating an airport' do
    it 'allows the creation of an airport' do
      array = []
      array << airport
      expect(array).to eq [airport]
    end
  end

  describe '#land' do
    it 'allows a plane to land' do
      expect(airport.land(plane)).to eq plane
    end
  end

  describe '#planes' do
    it 'allows confirmation that the plane has landed' do
      airport.land(plane)
      expect(airport.planes).to eq plane
    end
  end

end

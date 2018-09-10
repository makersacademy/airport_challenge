require 'airport'

describe Airport do
  before(:each) do
    @storm = double('weather')
    @no_storm = double('weather')
    allow(@storm).to receive(:is_stormy?) { true }
    allow(@no_storm).to receive(:is_stormy?) { false }
  end

  Airport.new(@storm) {is_expected.to respond_to(:stormy?)}
  context '#stormy?' do
    it 'returns true when weather at an airport is stormy' do
      stormy_airport = Airport.new(@storm)
      stormy_airport.stormy?
    end
  end
end

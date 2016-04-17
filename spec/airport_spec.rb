require 'airport'

describe Airport do
  let(:airport) {Airport.new}
  let(:planes) { double(:planes) }
  let(:airport_capacity_300) {Airport.new(300)}

  describe '#initalize' do
    it 'gets a random weather on initalization' do
      expect(airport.weather == "sunny" || airport.weather == "stormy").to eq(true)
    end
    it 'doesn\'t contain any planes on initalization' do
      expect(airport.planes.length).to eq(0)
    end
    it 'has a default capacity that can be overridden on initalization' do
      expect(Airport::DEFAULT_CAPACITY).to eq(30)
      expect(airport_capacity_300.capacity).to eq(300)
    end
  end
  describe '#full?' do
    it 'returns true if no of planes equals capacity' do

    #  allow(planes).to receive(:length).and_return(airport.capacity)

    #  expect(airport.full?).to eq(true)
    end
  end

end

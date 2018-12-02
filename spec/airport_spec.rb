require 'airport'

RSpec.describe Airport do
  before(:each) do
    @weather = Weather.new
    @airport = Airport.new(@weather)
  end

  describe '#land' do
    it 'lets the plane land if the weather is good' do
      airplane = Airplane.new
      allow(@weather).to receive(:stormy?) { false }
      expect(@airport.land(airplane)).to include(airplane)
    end
    it 'prevents the plane from landing if the airport is full' do
      airplane = Airplane.new
      allow(@weather).to receive(:stormy?) { false }
      expect(@airport.land(airplane)).to include(airplane)
    end
  end

  describe '#take_off' do
    it 'lets the plane take off if the weather is good' do
      airplane = Airplane.new
      allow(@weather).to receive(:stormy?) { false }
      @airport.land(airplane)
      expect(@airport.take_off(airplane)).to eq airplane
    end
  end

end

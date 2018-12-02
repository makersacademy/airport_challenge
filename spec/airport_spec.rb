require 'airport'

RSpec.describe Airport do
  before(:each) do
    @airport = Airport.new
  end

  it 'returns the plane which has landed' do
    airplane = Airplane.new
    expect(@airport.land(airplane)).to eq airplane
  end

  describe '#take_off' do
    it 'lets the plane take off if the weather is good' do
      airplane = Airplane.new
      allow(@airport).to receive(:stormy?) { 0 }
      @airport.land(airplane)
      expect(@airport.take_off).to eq airplane
    end

  end

end

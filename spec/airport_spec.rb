require 'airport'

RSpec.describe Airport do
  before(:each) do
    @airport = Airport.new
  end

  it 'checks if the weather is stormy' do
    expect(@airport.stormy?).to be(true).or be(false)
  end

  describe '#land' do
    it 'lets the plane land if the weather is good' do
      airplane = Airplane.new
      allow(@airport).to receive(:stormy?) { false }
      expect(@airport.land(airplane)).to eq airplane
    end
  end

  describe '#take_off' do
    it 'lets the plane take off if the weather is good' do
      airplane = Airplane.new
      allow(@airport).to receive(:stormy?) { false }
      @airport.land(airplane)
      expect(@airport.take_off).to eq airplane
    end
  end

end

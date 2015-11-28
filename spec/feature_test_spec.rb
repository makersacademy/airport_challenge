require 'airport'
require 'weather'
describe 'FEATURE TESTS' do

  describe 'Airport feature tests' do
    let(:airport) {Airport.new}
    let(:plane) {Plane.new}
    let(:weather) {Weather.new}

    it 'allows planes to land and confirms that they are landed' do
      airport.land(plane)
      expect(plane.status).to eq :on_the_ground
    end

    it 'allows planes to take off and confirm they are no longer in the airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect(plane.status).to eq :in_the_air
    end

  end





  

end

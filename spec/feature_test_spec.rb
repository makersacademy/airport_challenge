require 'airport'


describe 'Airport feature tests' do
  let(:airport) {Airport.new}
  let(:plane) {double(:plane)}

  it 'allows planes to land and confirms that they are landed' do
    airport.land(plane)
    expect(airport.planes).to eq plane
  end

  it 'allows planes to take off and confirm they are no longer in the airport' do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to eq nil
  end


end

require 'airport'


describe 'Airport feature tests' do
  let(:airport) {Airport.new}
  let(:plane) {double(:plane)}
  let(:weather) {double(:weather)}

  it 'allows planes to land and confirms that they are landed' do
    airport.land(plane)
    expect(airport.planes).to eq plane
  end

  it 'allows planes to take off and confirm they are no longer in the airport' do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to eq nil
  end

  it 'prevents take off if the weather is stormy' do
    weather = double(:weather, stormy?: true)
    airport.land(plane)
    message = "Can't take off due to stormy weather!"
    expect {airport.take_off(plane)}.to raise_error message
  end

end

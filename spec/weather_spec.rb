require 'weather.rb' # links the main code to the test file.

describe Weather do
  before(:each) do # will run these functions before doing each test... pretty jazzy.
    @weather = Weather.new
  end

  it 'responds to forecast' do
    expect(subject).to respond_to :forecast # simply a test that checks it recognises the method.
  end

  it 'returns either stormy or clear when forecast is called' do
    expect(@weather.forecast).to eq("Stormy").or eq "Clear"
  end

end

# it 'raises a departure error if the weather is stormy' do
#   @airport.land_plane(@plane)
#   @airport.weather
#   expect { @airport.fly_plane }.to raise_error("Stop, no departures or arrivals due to stormy weather!")
# end
#
# it 'raises an arrival error if the weather is stormy' do
#   @airport.weather
#   expect { @airport.land_plane(@plane) }.to raise_error("Stop, no departures or arrivals due to stormy weather!")
# end

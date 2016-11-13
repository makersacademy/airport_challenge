require 'airplane.rb'
require 'airport.rb'

describe "airport" do
  it 'has weather' do
    airport = Airport.new
    airport.set_weather("stormy")
    expect(airport.get_weather).to eq "stormy"
  end
end

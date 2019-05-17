require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  it 'has a default state of "flying"' do 
    expect(plane.flying).to eq(true)
  end 

  it 'returns a number between 1 and 6 in weather_number' do 
    expect(plane.weather_number).to be < 7
    expect(plane.weather_number).to be > 0 
  end 
end

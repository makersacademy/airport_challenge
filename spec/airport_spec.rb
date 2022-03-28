require './lib/airport.rb'

describe 'control the flow of planes method' do

  it 'can have default values' do
    airport = Airport.new
        
    expect(airport.get_capacity).to eq(3)
    expect(airport.get_weather).to eq("sunny")
  end

  it 'can add a flight in the airport' do
    airport = Airport.new

    expect(airport.add_flight).to eq(1)
  end

  it 'can remove a flight from the airport' do
    airport = Airport.new
    airport.add_flight

    expect(airport.remove_flight).to eq(0)
  end

  it 'raises error when there is no flight in the airport' do
    airport = Airport.new

    expect{airport.remove_flight}.to raise_error "no flight to be removed"
  end

  it 'can get the capacity of airport' do
    airport = Airport.new(2)

    expect(airport.get_capacity).to eq(2)
  end

  it 'can get the current number of planes in the airport' do
    airport = Airport.new
    airport.add_flight

    expect(airport.get_current).to eq(1)
  end

  it 'can get the weather of airport' do
    airport = Airport.new(15, "stormy")

    expect(airport.get_weather).to eq("stormy")
  end

end
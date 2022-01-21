require './lib/airport.rb'

describe 'control the flow of planes method' do

  it 'can have a default capacity' do
    airport = Airport.new("stormy")
        
    expect(airport.instance_variable_get(:@capacity)).to eq(3)
  end

  it 'can land due to less flights' do
    airport = Airport.new(5)
    expect(airport.land).to eq("good for landing!")
  end

  it 'can land due to normal weather' do
    airport = Airport.new(5, "normal")
    
    expect(airport.land).to eq("good for landing!")
  end

  it 'cannot land due to more flights' do
    airport = Airport.new(5)
    airport.land
    airport.land
    airport.land
    airport.land
    airport.land

    expect(airport.land).to eq("no landing for now!")
  end

  it 'cannot land due to stormy weather' do
    airport = Airport.new(5, "stormy")
    
    expect(airport.land).to eq("no landing for now!")
  end
  
  it 'can take-off' do
    airport = Airport.new(5)
    airport.land

    expect(airport.take_off).to eq("took off! no longer in the airport")
  end

  it 'can take-off due to normal weather' do
    airport = Airport.new(5, "normal")
    airport.land

    expect(airport.take_off).to eq("took off! no longer in the airport")
  end

  it 'cannot take-off due to no flights' do
    airport = Airport.new(5)
    
    expect(airport.take_off).to eq("cannot take-off")
  end

  it 'cannot take-off due to stormy weather' do
    airport = Airport.new(5, "stormy")
    airport.land

    expect(airport.take_off).to eq("cannot take-off")
  end

end
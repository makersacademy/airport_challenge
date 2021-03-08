require './lib/airport.rb'

describe Airport do


  it 'has default capacity' do
    airport = Airport.new
    expect(airport.planes).to eq([])
  end

end

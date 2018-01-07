require 'airport'

describe 'Airports having weather' do
  it 'should be given weather on instantiation' do
    airport = Airport.new
    expect(airport.weather).to be_a Weather
  end
end

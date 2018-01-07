require 'airport'

describe 'Airports having weather' do
  it 'should be given weather on instantiation' do
    airport = Airport.new
    expect(airport.weather).to be_a Weather
  end

  it 'should not return nil when asked if stormy' do
    airport = Airport.new
    expect(airport.weather.stormy?).to_not eq nil
  end
end

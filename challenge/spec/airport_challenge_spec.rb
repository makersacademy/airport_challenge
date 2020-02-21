require 'airport_challenge'

describe 'Airport' do
it 'can create an instance of class Airport' do
  jfk_airport = Airport.new
  expect(jfk_airport).to be_a Airport
end

describe 'land' do
  it 'can land a plane' do
    jfk_airport = Airport.new
    jfk_airport.land
  expect(jfk_airport).to respond_to(:land)
  end
end

describe 'take off' do
  it 'can take off and confirm there is no longer in the airport' do
    heathrow_airport = Airport.new
    heathrow_airport.take_off
    expect(heathrow_airport).to respond_to(:take_off)
  end
end
end

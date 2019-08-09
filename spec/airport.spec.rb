require 'airport'
describe Airport do
  it 'can create an instance of a airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end
end

it 'can create an instance of a plane' do
  airport = Airport.new
  expect(airport).to respond_to(:plane)
end

it 'should show a plane has landed' do
  airport = Airport.new
  expect(airport.plane).to eq(:landed)
end

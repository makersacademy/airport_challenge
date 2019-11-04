require './lib/airport.rb'

describe Airport do
  it 'expects airport to be an instance of airport class' do
  airport = Airport.new
  expect(airport).to be_instance_of(Airport)
end
end

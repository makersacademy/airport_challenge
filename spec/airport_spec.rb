require 'airport'

RSpec.describe Airport do

  it {is_expected.to respond_to(:run_way)}

  it {is_expected.to respond_to(:airport_check)}

  it '#run_way should defualt to an empty array' do
  expect(subject.run_way).to eq([])
end


it 'expects the plane to take_of from airport it is in' do
  airport = Airport.new
  plane = Plane.new
  airport.airport_check(plane)
  expect(airport.run_way).to eq([plane])
end

it 'raises' do
  weather = double(:weather)
  allow(weather).to receive(:status) {'sunny'}
  weathers = class_double("Weather").as_stubbed_const
  allow(weathers).to receive(:new) {weather}
airport = Airport.new
airport3 = Airport.new
plane = Plane.new(true)
plane.land(airport,plane)
expect {(plane.take_of(airport3,plane))}.to raise_error "plane is not in this airport"
end
end

require 'airport'

RSpec.describe Airport do


  it '#lands planes' do
  Heathrow = Airport.new
  plane1 = Plane.new
  expect(Heathrow.lands(plane1)).to eq [plane1]
end
end

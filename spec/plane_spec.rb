require './lib/airport'
require './lib/plane'

describe Plane do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it {is_expected.to respond_to :land}
  it {is_expected.to respond_to :landed?}
  it {is_expected.to respond_to :takeoff}

context '#landed? and #takeoff' do

 it "confirms that plane has landed" do
  airport.land(plane)
  expect(plane.landed?).to eq true

end
  it "confirms that a plane is no longer landed" do
  airport.takeoff(plane)
  expect(plane.landed?).to eq false


end
end
end

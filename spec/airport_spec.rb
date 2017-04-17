require 'airport'
require 'weather'

describe Airport do

it { is_expected.to respond_to(:confirm_landing).with(1).argument}
it { is_expected.to respond_to(:confirm_takeoff).with(1).argument}
end

describe '#confirm_landing' do
  it "should confirm landing by adding a new plane  -the argument- to an array" do
    plane = Plane.new
    airport = Airport.new
    expect(airport.confirm_landing(plane)).to eq [plane]
end
end

describe '#confirm_takeoff' do

end

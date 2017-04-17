require 'airport'
require 'weather'

describe Airport do

it { is_expected.to respond_to(:confirm_landing).with(1).argument}
it { is_expected.to respond_to(:confirm_takeoff).with(1).argument}
it { is_expected.to respond_to :stormy_weather?}
end

describe '#confirm_landing' do
  it "should confirm landing by adding a new plane  -the argument- to the array of planes in the airport" do
    plane = Plane.new
    airport = Airport.new
    expect(airport.confirm_landing(plane)).to eq [plane]
end
end

describe '#confirm_takeoff' do
  context "weather is fine" do
    it "should confirm takeoff by popping a plane from the array of planes in the airport" do
    plane = Plane.new
    airport = Airport.new
    airport.stormy_weather?
    airport.confirm_landing(plane)
    expect(airport.confirm_takeoff(plane)).to eq plane
    end
  end
  context "weather is stormy" do
    it 'should raise error when confirming takeoff if weather is stormy - fail error' do
    plane = Plane.new
    airport = Airport.new
    airport.confirm_landing(plane)
    airport.stormy_weather? 
    expect {airport.confirm_takeoff(plane)}.to raise_error 'Stormy weather, cannot takeoff'
    end
   end
end

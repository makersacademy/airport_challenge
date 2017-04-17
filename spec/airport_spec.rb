require 'airport'
require 'weather'

describe Airport do

it { is_expected.to respond_to(:confirm_landing).with(1).argument}
it { is_expected.to respond_to(:confirm_takeoff).with(1).argument}
it { is_expected.to respond_to :stormy_weather?}
end

describe '#confirm_landing' do
  context 'if weather is fine' do
    it "should confirm landing by adding a new plane  -the argument- to the array of planes in the airport" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy_weather?).and_return(false)
      expect(airport.confirm_landing(plane)).to eq [plane]
    end
  end
  context 'if weather is stormy' do
    it "should raise error and not confirm landing if the weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy_weather?).and_return(true)
    expect {airport.confirm_landing(plane)}.to raise_error 'Stormy weather, cannot land'
  end
  end
end

describe '#confirm_takeoff' do
  context "if weather is fine" do
    it "should confirm takeoff by popping a plane from the array of planes in the airport" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy_weather?).and_return(false)
      airport.confirm_landing(plane)
      expect(airport.confirm_takeoff(plane)).to eq plane
    end
  end
  context "if weather is stormy" do
    it 'should raise error when confirming takeoff if weather is stormy - fail error' do
      airport = Airport.new
      plane = Plane.new
      airport.confirm_landing(plane)
      allow(airport).to receive(:stormy_weather?).and_return(true)
    expect {airport.confirm_takeoff(plane)}.to raise_error 'Stormy weather, cannot takeoff'
    end
   end
end

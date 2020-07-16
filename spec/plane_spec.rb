require 'plane'
require 'airport'
describe Plane do
  it 'can create an instance of a plane' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end
  context "when instructed" do
    it 'can land a plane safely at the airport' do
      plane = Plane.new
      airport = AirPort.new
      expect(plane).to receive(:land).with(airport)
      plane.land(airport)
    end
end
end

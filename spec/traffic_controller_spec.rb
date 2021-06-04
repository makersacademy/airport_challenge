
require "traffic_controller"
describe Airport do
  subject(:airport) { described_class.new(50) }
  it "instruct a plane to land" do 
    expect(airport).to respond_to(:land).with(1).argument
  end
  it "instruct a plane to take off" do 
    expect(airport).to respond_to(:take_off).with(1).argument
  end 
  it "does not allow landing because of capacity" do
     plane = double :plane
    50.times do 
      airport.land(plane)
    end 
    expect { airport.land(plane) }.to raise_error "Cannot land: airoport full."
  end
end
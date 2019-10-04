require 'airport'
describe Airport do

  it "makes a plane land at an airport" do
    expect(subject).to respond_to :land
  end

  it "lets a plane take off from the airport" do
    airport1 = Airport.new
    plane1 = Plane.new
    airport1.land(plane1)
    airport1.take_off(plane1)
    expect(airport1.planes_here.count).to eq(0)
  end

  it "doesnt let planes land when at full capacity" do
    airport1 = Airport.new(1)
    airport1.land(Plane.new)
    expect { airport1.land(Plane.new) }.to raise_error "airport full!"
  end

end

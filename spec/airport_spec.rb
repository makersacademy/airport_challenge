require 'airport'
describe Airport do 

  it "can create an instance of itself" do
    expect(subject).to be_an_instance_of(Airport)
  end

  it "can respond to laning a plane" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "can store the plane in the airport" do
    plane = subject.land(plane)
    expect(subject.land(plane)).to eq plane
  end

  it "allows a plane to take off from the airport" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "raises an error when landing a plane and airport is full" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect { airport.land(Plane.new) }.to raise_error "Airport is Full"
  end

end

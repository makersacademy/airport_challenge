require 'airport'
describe Airport do 

  it "can create an instance of itself" do
    subject = Airport.new
    expect(subject).to be_an_instance_of(Airport)
  end

  it "can respond to laning a plane" do
    subject = Airport.new
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "can store the plane in the airport" do
    subject = Airport.new
    plane = Plane.new
    plane = subject.land(plane)
    expect(subject.land(plane)).to eq plane
  end

  it "allows a plane to take off from the airport" do
    subject = Airport.new
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "raises an error when landing a plane and airport is full" do
    subject = Airport.new
    plane = Plane.new
    5.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error "Airport is Full"
  end

  it "will initilize with a capacity of 5" do
    subject = Airport.new
    5.times { subject.land(Plane.new) }
    expect(subject.capacity).to eq 5
  end 
end
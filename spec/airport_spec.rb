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
    plane = subject.land(plane)
    expect(subject.land(plane)).to eq plane
  end
end

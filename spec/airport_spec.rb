require 'airport'

describe Airport do

    it "can land a plane" do
      expect(subject).to respond_to(:land).with(1).argument
    end

  it "instructs a plane to take off" do
    expect(subject).to respond_to(:take_off).with(1).argument 
  end 

  it "it confirms a plane that has taken off is not in the airport" do 
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.plane).to eq plane 
  end 

end

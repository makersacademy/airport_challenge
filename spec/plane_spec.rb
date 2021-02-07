require "plane"

describe Plane do 

  it "instructs a plane to land at an airport" do 
    expect(subject).to respond_to(:land)
  end

  it "instructs a plane to take off from an airport" do 
    expect(subject).to respond_to(:take_off)
  end 

  it "confirms that plane is no longer in the airport" do 
    expect(subject.take_off).to eq "Plane took off"
  end

end

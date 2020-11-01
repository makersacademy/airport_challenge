require 'airport'

describe Airport do

  describe "#land" do 

    it "prevents a landing if airport is full" do 
      subject.land(Plane.new)
      expect { subject.land Plane.new }.to raise_error "Airport is full"
    end 

    # it "can land a plane" do
    #  expect(subject).to respond_to(:land).with(1).argument
    # end

  end

  describe "#take_off" do 

    it "instructs a plane to take off" do
      expect(subject).to respond_to(:take_off).with(1).argument 
    end 

    it "confirms a plane that has taken off is not in the airport" do 
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.plane).to eq plane 
    end 

  end 

end

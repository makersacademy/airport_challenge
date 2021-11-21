require 'airport'
describe Airport do 
  subject(:airport) {described_class.new}

  it "can create an instance of itself" do
    expect(subject).to be_an_instance_of(Airport)
  end
  
  it "allows a plane to take off from the airport" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "raises an error when landing a plane and airport is full" do
    5.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error "Airport is Full"
  end

  describe "#land" do
    it "can respond to laning a plane" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "can store the landed plane in the airport" do
      plane = Plane.new
      plane = subject.land(plane)
      expect(subject.land(plane)).to eq plane
    end
  end

  describe "#initilize" do
    it "will initilize with a default capacity of 5" do
      5.times { subject.land(Plane.new) }
      expect(subject.capacity).to eq 5
    end 

    it "will initilize with the capacity specified" do
      subject = Airport.new(6)
      expect(subject.capacity).to eq 6
    end
  end

end
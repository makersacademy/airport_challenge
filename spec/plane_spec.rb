require "plane"

describe Plane do 
  it "Create instance of a plain" do 
    expect(subject).to be_instance_of(Plane)
  end

  describe "#status" do 
    it "check the status of the plain" do 
      expect(subject.status).to eq "air"
    end 
  end 

  describe "#location" do
    it "Tells at wich airport is the plane at the moment" do
      expect(subject.location).to eq nil
    end
  end

end

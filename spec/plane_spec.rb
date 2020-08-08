require "plane"

describe Plane do 
  it "Create instance of a plain" do 
    expect(subject).to be_instance_of(Plane)
  end

  describe "#status" do 
    it "check the status of the plain and return false if it's landed" do 
      expect(subject.status).to eq false
    end 
  end 
end

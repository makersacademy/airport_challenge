require "plane"

describe Plane do

  describe "#change_location" do

    it "changes the location of the plane" do
      subject.change_location("in air")
      expect(subject.location).to eq "in air"
    end

  end

  describe "#locate_plane" do

    let(:lhr) { double :lhr }

    it "locates the plane by printing the name of the Airport" do
      allow(lhr).to receive(:name) { "lhr" }
      subject.change_location(lhr)
      expect { subject.locate_plane }.to output { "Plane is in lhr" }.to_stdout
    end

    it "Prints if the plane is currently in air" do
      subject.change_location("in air")
      expect { subject.locate_plane }.to output { "Plane is in air" }.to_stdout
    end

  end
end

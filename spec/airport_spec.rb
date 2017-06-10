require "airport.rb"

describe Airport do

  describe '#land' do
    it "has a land method with one argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end

    it "instructs a plane to land" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it "confirms the status of the plane" do
      plane = Plane.new
      expect(subject.confirm_status(plane)).to eq("available")
    end

    it "confirms that the plane has landed/arrived" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.confirm_status(plane)).to eq("arrived")
    end
end

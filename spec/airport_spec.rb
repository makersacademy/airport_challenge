require "airport.rb"

describe Airport do

  describe '#land' do
    it "has a land method with one argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "lands a plane at the airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  describe '#confirm_status' do
    it "confirms the status of the plane" do
      plane = Plane.new
      expect(subject.confirm_status(plane)).to eq(nil)
    end

    it "confirms that the plane has landed/arrived" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.confirm_status(plane)).to eq("arrived")
    end

    it "confirms that the plane has departed" do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.confirm_status(plane)).to eq("departed")
    end
  end

  describe '#take_off' do
    it "instructs a plane to take_off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "confirms the plane is no longer in the airport" do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end
end

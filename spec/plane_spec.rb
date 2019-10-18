require "plane"

describe Plane do
  describe "#land" do
    it { is_expected.to respond_to :land }

    it "lands at the specified destination" do
      airliner1 = Plane.new
      airliner1.land("Tokyo")
      expect(airliner1.flying).to be(false)
      expect(airliner1.location).to eq("Tokyo")
    end

    it "reports plane as landed" do
      airliner1 = Plane.new
      expect { airliner1.land("Munich") }.to output("Landed at Munich airport at #{Time.new}\n").to_stdout
    end
  end

  describe "takeoff" do
    it "leaves the current airport" do
      airliner1 = Plane.new
      airliner1.takeoff
      expect(airliner1.flying).to be(true)
      expect(airliner1.location).to eq("in transit")
    end

    it "reports plane has left airport" do
      airliner2 = Plane.new
      expect { airliner2.takeoff }.to output("Leaving Factory airport at #{Time.new}\n").to_stdout
    end
  end
end

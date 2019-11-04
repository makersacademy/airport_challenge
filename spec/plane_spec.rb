require "plane"

describe Plane do
  describe "#land" do
    it { is_expected.to respond_to :land }

    it "lands at the specified destination" do
      subject.land("Tokyo")
      expect(subject.flying).to be(false)
      expect(subject.location).to eq("Tokyo")
    end

    it "reports plane as landed" do
      expect { subject.land("Munich") }.to output("Landed at Munich airport at #{Time.new}\n").to_stdout
    end
  end

  describe "takeoff" do
    it "leaves the current airport" do
      subject.takeoff
      expect(subject.flying).to be(true)
      expect(subject.location).to eq("in transit")
    end

    it "reports plane has left airport" do
      expect { subject.takeoff }.to output("Leaving Factory airport at #{Time.new}\n").to_stdout
    end
  end
end

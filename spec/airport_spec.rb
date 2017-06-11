require 'airport'

describe Airport do
  let(:plane) { double("plane")}

  describe "Initialization" do
    it "Creates a new airport with empty gates" do
      expect(subject).to respond_to :gates
      expect(subject.gates).to be_a Array
    end
  end

  describe "#instruct" do
    it "responds to instruct" do
      expect(subject).to respond_to(:instruct).with(1).argument
    end

    it "instructs a plane to land" do
      allow(plane).to receive(:grounded?).and_return(false)
      allow(plane).to receive(:grounded=)

      subject.instruct({action: "land", plane: plane})
      expect(subject.gates.last).to eq plane
    end

    it "instructs a plane to take off" do
      subject.gates.push(plane)
      allow(plane).to receive(:grounded=)
      allow(plane).to receive(:grounded?).and_return(true)

      subject.instruct({action: "take off", plane: subject.gates.last})
      expect(subject.gates).to_not include(plane)
    end

    it "raises an error if the selected plane isn't at the airport" do
      allow(plane).to receive(:grounded?).and_return(true)
      expect{ subject.instruct({action: "take off", plane: plane}) }.to raise_error("Plane not found")
    end
  end

  describe "#report" do
    it "responds to report" do
      expect(subject).to respond_to :report
    end

    it "reports when a plane has landed" do
      expect{ subject.report("land", plane) }.to output("#{plane} has landed successfully.\n").to_stdout
    end

    it "reports when a plane has taken off" do
      expect{ subject.report("take off", plane) }.to output("#{plane} has taken off successfully.\n").to_stdout
    end
  end
end

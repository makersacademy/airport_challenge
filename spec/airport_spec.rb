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
      expect(subject).to respond_to :instruct
    end

    it "instructs a plane to land" do
      subject.instruct(plane)
      expect(subject.gates.last).to eq plane
    end
  end

  describe "#report" do
    it "responds to report" do
      expect(subject).to respond_to :report
    end

    it "reports when a plane has landed" do
      expect(subject.report(plane)).to eq "#{plane} has landed successfully."
    end
  end
end

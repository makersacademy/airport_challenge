require "airport"

RSpec.describe Airport do
  let(:plane) {double :plane}
  describe "#receive" do
    it "allows airport to store valid plane"do
      subject.receive(plane)
      expect(subject.planes).not_to be_empty
    end
  end
  describe "#send" do
    it "allows a plane to take off" do
      subject.receive(plane)
      expect(subject.send()).to be_truthy 
    end

    it "removes the plane from the airport" do
      # airport = subject
      subject.receive(plane)
      subject.send()
      expect(subject.planes).to be_empty
    end

    it "disallows takeoff if no planes" do
      expect(subject.send()).to eq(false)
    end
  end
end
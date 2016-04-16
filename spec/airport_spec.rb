require "airport"
describe Airport do
  it { expect(subject).to respond_to :planes }
  it { expect(subject).to respond_to(:accept).with(1).argument }

  let(:plane) { double(:plane) }

  describe "#planes" do
    it "should return an array" do
      expect(subject.planes).to be_an Array
    end
  end

  describe "#accept" do
    it "should add the object to @planes" do
      subject.accept plane
      expect(subject.planes).to include plane
    end
  end
end
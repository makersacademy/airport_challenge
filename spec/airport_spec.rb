require "airport"
describe Airport do
  it { expect(subject).to respond_to :planes }
  it { expect(subject).to respond_to(:accept).with(1).argument }

  let(:plane) { double(:plane, flying?: false) }
  let(:flying_plane) { double(:plane, flying?: true) }

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
    it "should raise an error if the plane is still flying" do
      expect { subject.accept flying_plane }.to raise_error "Plane is still flying!"
    end
  end
end
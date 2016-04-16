require "airport"
describe Airport do
  it { expect(subject).to respond_to :planes }
  it { expect(subject).to respond_to(:accept).with(1).argument }

  let(:flying_plane) { double(:plane, flying?: true, land: false) }
  let(:grounded_plane) { double(:plane, flying?: false, land: false) }

  describe "#planes" do
    it "should return an array" do
      expect(subject.planes).to be_an Array
    end
  end

  describe "#accept" do
    it "should add the object to @planes" do
      subject.accept flying_plane
      expect(subject.planes).to include flying_plane
    end
    it "should check if the plane is flying" do
      expect(flying_plane).to receive :flying?
      subject.accept flying_plane
    end
    it "should tell the plane to land if the plane is flying" do
      expect(flying_plane).to receive :land
      subject.accept flying_plane
    end
    it "should raise an error if the plane is already grounded" do
      expect { subject.accept grounded_plane }.to raise_error "Plane is already at an airport"
    end
  end
end
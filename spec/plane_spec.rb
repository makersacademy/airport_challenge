describe Plane do
  it "is a plane" do
    it {is_expected.to respond_to :land}
  end
  describe "#land" do
    it "should land a plane at an airport" do
      expect(subject.land).to eq "Plane's landed!"
    end
  end
end

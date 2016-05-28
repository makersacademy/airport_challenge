require 'airport'

describe Airport do

  let (:plane) {double :plane}
  let (:weather) {double :weather}


  describe "#dock" do
    it "docks planes" do
      plane1 = plane
      subject.dock(plane1)
      expect(subject.release).to eq plane1
    end
  end

  describe "#release"
    it "releases planes" do
      plane1 = plane
      subject.dock(plane1)
      expect(subject.release).to eq plane1
    end
end

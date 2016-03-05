require 'plane'

describe Plane do
  it "should initialize with a 'flying' attribute" do
    expect(subject.flying).to eq false
  end

  describe "land" do
    it "should change 'flying' to false" do
      subject.land
      expect(subject.flying).to eq false
    end

  end

end

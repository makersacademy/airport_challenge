require 'plane'

describe Plane do
  it {is_expected.to respond_to :has_landed}
  #it {is_expected.to respond_to :landed?}

  describe '#landed?' do
    subject(:plane) {described_class.new}
    it "tells if the palne has not yet landed" do
      expect(plane.landed?).to be_falsy
    end

    it "tells that a plane has landed" do
      plane.has_landed
      expect(plane.landed?).to be true
    end
  end

end

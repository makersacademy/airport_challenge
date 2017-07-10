require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  
  it {should respond_to (:landed?)}
  it {should respond_to (:departed?)}

  describe '#landed?' do
    it "confirms that the plane has landed" do
      expect(plane.landed?).to eq true
    end
  end

describe '#departed?' do
  it "checks that the plane has left the airport" do
    expect(plane.departed?).to eq true
  end
end
end

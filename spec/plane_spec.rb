require 'plane'
require 'airport'

describe Plane do
  let(:airport) { Airport.new }

  it { is_expected.to respond_to :landed? }

  describe '#landed?' do
    it "checks if plane has landed" do
      plane = Plane.new
      airport = Airport.new
      allow(airport).to receive(:storms?){false}
      airport.land(plane)
      expect(plane).to be_landed
    end
  end

  it { is_expected.to respond_to :on_air? }

  describe '#on_air?' do
    it "checks if plane has taken off" do
      allow(airport).to receive(:storms?){false}
      plane = Plane.new
      expect(plane).to be_on_air
    end
  end

end

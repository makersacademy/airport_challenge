require './lib/plane.rb'

describe Plane do
  subject(:plane) { described_class.new }

  context "#confirm the plane has landed" do
    it '#able to land a flying plane' do
      subject.land_plane
      expect(subject.flying).to be false
    end
  end

  context "#confirm that a plane has taken off" do
    it "#the plane has left the airport" do
      subject.plane_take_off
      expect(subject.flying).to be true
    end
  end

end

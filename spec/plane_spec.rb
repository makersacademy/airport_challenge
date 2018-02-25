require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  before(:each) do
    @fk_airport = double(:park_plane => nil, :launch_plane => nil)
  end

  describe '#land' do

    it 'lands at an airport' do
      expect(@fk_airport).to receive :park_plane
      plane.land(@fk_airport)
    end

    it "doesn't land unless flying" do
      plane.land(@fk_airport)
      expect {
        plane.land(@fk_airport)
      }.to raise_error('Plane is on ground!')
    end

  end

  describe '#takeoff' do

    it 'takes off from an aiport if parked' do
      plane.land(@fk_airport)
      expect(@fk_airport).to receive :launch_plane
      plane.takeoff(@fk_airport)
    end

    it "doesn't takeoff unless parked" do
      expect {
        plane.takeoff(@fk_airport)
      }.to raise_error('Plane is already flying!')
    end

  end

end

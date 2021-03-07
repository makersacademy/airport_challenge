require 'airport'

describe "Feature Test" do
  describe "given 2 planes and 2 airports, try to land both at the airport with 1 capacity, fail and then land one at each" do
    before do
      @jfk = Airport.new(1, "JFK")
      @heathrow = Airport.new(2, "Heathrow")
      @test_plane_1 = Plane.new
      @test_plane_2 = Plane.new
      allow(@jfk).to receive(:stormy?).and_return(false)
      allow(@heathrow).to receive(:stormy?).and_return(false)
    end

    context "can't land two planes at JFK, so only one lands at JFk" do
      it { expect(@jfk.request_to_land(@test_plane_1)).to eq "Plane has landed." }
    end

    context "expects test_plane_2 to be rejected when it tries to land at JFK" do
      before do
        @jfk.request_to_land(@test_plane_1)
      end
      it { expect(@jfk.request_to_land(@test_plane_2)).to eq "Plane cannot land, Airport is full." }
    end

    context "test_plane_2 then lands at Heathrow where there is room" do
      it { expect(@heathrow.request_to_land(@test_plane_2)).to eq "Plane has landed." }
    end
  end
end

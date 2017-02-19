require 'airport'

describe Airport, :feature_test do
  let(:small_airport) { described_class.new(2) }

  before do
    allow_any_instance_of(Weather).to receive(:stormy?) { false }
  end

  describe "#feature_test" do
    context "Sets capacity at 2, instructs 2 planes to land, confirms they have landed one by one.
    Then instructs take off and confirms take off for each plane." do
      it "passes the feature test" do
        plane1, plane2 = Plane.new, Plane.new
        p "Capacity is set at: #{small_airport.capacity}"
        p "Instructing Plane 1 to land."
        small_airport.instruct_to_land(plane1)
        p small_airport.confirm_landed(plane1)
        p "Instructing Plane 2 to land."
        small_airport.instruct_to_land(plane2)
        p small_airport.confirm_landed(plane2)
        p "The airports in the plane are: #{small_airport.plane_arr.join(", ")}"
        p "Instructing Plane 1 to take off."
        small_airport.take_off(plane1)
        p small_airport.confirm_takeoff(plane1)
        p "Instructing Plane 2 to take off."
        small_airport.take_off(plane2)
        p small_airport.confirm_takeoff(plane2)
        p "Checking airport is now empty..."
        p "There are now #{small_airport.plane_arr.length} planes in the airport\
 and the capacity is still #{small_airport.capacity}."
        message = "#{plane2} is not in the airport."
        expect{small_airport.confirm_landed(plane2)}.to raise_error message
      end
    end
  end
end

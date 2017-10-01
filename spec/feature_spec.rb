Dir["./lib/*.rb"].each { |file| require file }

describe "Feature Tests: " do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  stormy = false

  describe "Planes taking off" do
    context "A plane that has taken off" do

      it "should no longer say it's at an airport" do

        airport.land(plane)
        airport.take_off(plane)
        expect(plane.at_airport).to eq false

      end

    end
  end
end

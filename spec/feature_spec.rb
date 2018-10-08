require "./lib/plane.rb"
require "./lib/airport.rb"

describe "features" do
  context "Feature test that tests multiple user stories" do
    before(:each) do
      allow_any_instance_of(Weather).to receive(:set_weather).and_return('sunny')
    end

    it "is a supersystem of many airports that can handle many planes" do
      plane1 = Plane.new
      plane2 = Plane.new
      plane3 = Plane.new
      plane4 = Plane.new
      plane5 = Plane.new
      airport1 = Airport.new("London",10)
      airport2 = Airport.new("Paris",5)
      airport3 = Airport.new("Rome")
      expect(airport1.allow_land(plane1)).to eq(true)
      expect{airport1.allow_land(plane1)}.to raise_error ("Already landed; Cant do it twice!")
      expect(airport1.allow_takeoff(plane1,airport2)).to eq(true)
      expect{airport1.allow_takeoff(plane1,airport2)}.to raise_error ("The plane isnt here!")
    end
  end
end

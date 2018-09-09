require 'airport'

describe Airport do
  context "The weather is good and there is space in the hanger" do
    # weather needs to be good
    # and the hanger can't be full
    let(:plane) { double :plane }

    before(:each) do
      allow(subject).to receive(:bad_weather?).and_return(false)
      allow(subject).to receive(:hanger_full?).and_return(false)
    end

    it "has a working Airport#land(plane) method" do
      allow(plane).to receive(:location).and_return("Airborn")
      allow(plane).to receive(:grounded)

      expect(subject.land(plane)).to eq([plane])
    end

    it "has a working Airport#takeoff(plane) method" do
      allow(plane).to receive(:location).and_return(subject)
      allow(plane).to receive(:airborn).and_return("Airborn")

      expect(subject.takeoff(plane)).to eq("Airborn")
    end

    it "rejects edge cases: Airborn plane trying to takeoff" do
      airport = Airport.new
      airport.takeoff(plane)
      expect(airport.takeoff(plane)).to eq("Cannot takeoff. Plane already airborn")
    end

    it "rejects edge cases: Grounded plane trying to land" do
      plane = Plane.new
      airport = Airport.new
      expect(airport.land(plane)).to eq("Cannot land. Plane already on the ground")
    end

    it "rejects edge cases: Planes cannot takeoff from airports that they aren't in" do
      plane = Plane.new
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.takeoff(plane)
      airport2.land(plane)
      expect(airport1.takeoff(plane)).to eq("Plane at wrong airport")
    end
  end

  context "The weather is good but there is no space in the hanger" do

    let(:plane) { double :plane }

    it "can set Airport @hanger capacity to 0" do
      airport = Airport.new(0)
      allow(airport).to receive(:bad_weather?).and_return(false)
      allow(airport).to receive(:hanger_full?).and_return(true)

      allow(plane).to receive(:location).and_return("Airborn")
      allow(plane).to receive(:grounded)

      expect(airport.land(plane)).to eq("The plane can't land because the hanger is full")
    end
  end

end

# describe Airport do
# # weather needs to be bad
# # and the hanger can't be full
#   it "has a working Airport#bad_weather? method" do
#     expect(subject.bad_weather?).to eq(true)
#   end
#
#   it "can prevent takeoff when there is bad weather" do
#     expect(subject.takeoff(Plane.new)).to eq("The weather is too bad to fly")
#   end
#
#   it "can prevent landing when there is bad weather" do
#     plane = Plane.new
#     # takeoff under good weather
#     subject.takeoff(plane)
#     # try to land during bad weather
#     expect(subject.land(plane)).to eq("The weather is too bad to land")
#   end
# end

# describe Airport do
# # weather need to be good
# # and hanger needs to full
#   it "has a working Airport.hanger_full? method" do
#     expect(subject.hanger_full?).to eq(true)
#   end
#
#   it "can prevent landing when the hanger is full" do
#     plane = Plane.new
#     Airport.new.takeoff(plane)
#     expect(subject.land(plane)).to eq("The plane can't land because the hanger is full")
#   end
# end

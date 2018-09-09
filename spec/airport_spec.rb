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
      allow(plane).to receive(:location).and_return("Airborn")

      expect(subject.takeoff(plane)).to eq("Cannot takeoff. Plane already airborn")
    end

    it "rejects edge cases: Grounded plane trying to land" do
      allow(plane).to receive(:location).and_return(subject)

      expect(subject.land(plane)).to eq("Cannot land. Plane already on the ground")
    end

    it "rejects edge cases: Planes cannot takeoff from airports that they aren't in" do
      airport2 = Airport.new
      allow(plane).to receive(:location).and_return(subject)

      expect(airport2.takeoff(plane)).to eq("Plane at wrong airport")
    end

    it "has a working Airport.hanger_full? method" do
      expect(subject.hanger_full?).to eq(false)
    end
  end

  context "The weather is good but there is no space in the hanger" do
    # weather need to be good
    # and hanger needs to full

    let(:plane) { double :plane }

    it "can prevent landing when the hanger is full" do
      airport = Airport.new(0)

      allow(airport).to receive(:bad_weather?).and_return(false)
      allow(airport).to receive(:hanger_full?).and_return(true)

      allow(plane).to receive(:location).and_return("Airborn")
      allow(plane).to receive(:grounded)

      expect(airport.land(plane)).to eq("The plane can't land because the hanger is full")
    end
  end



# weather needs to be bad
# and the hanger can't be full
  context "The weather is bad but there's space in the hanger" do

    let(:plane) { double :plane }

    before(:each) do
        allow(subject).to receive(:bad_weather?).and_return(true)
        allow(subject).to receive(:hanger_full?).and_return(false)
    end

    it "has a working Airport#bad_weather? method" do
      expect(subject.bad_weather?).to eq(true)
    end

    it "can prevent takeoff when there is bad weather" do
      allow(plane).to receive(:location).and_return(subject)
      expect(subject.takeoff(plane)).to eq("The weather is too bad to fly")
    end

    it "can prevent landing when there is bad weather" do
      allow(plane).to receive(:location).and_return("Airborn")
      expect(subject.land(plane)).to eq("The weather is too bad to land")
    end
  end
end

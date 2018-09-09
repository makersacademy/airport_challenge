require 'airport'

describe Airport do

  let(:plane) { double :plane }

  context "The weather is good and there is space in the hanger" do

    before(:each) do
      allow(subject).to receive(:bad_weather?).and_return(false)
      allow(subject).to receive(:hanger_full?).and_return(false)
    end

    it "has a working Airport#land(plane) method" do
      allow(plane).to receive(:location).and_return("Airborne")
      allow(plane).to receive(:grounded)

      expect(subject.land(plane)).to eq([plane])
    end

    it "has a working Airport#take_off(plane) method" do
      allow(plane).to receive(:location).and_return(subject)
      allow(plane).to receive(:airborne).and_return("Airborne")

      expect(subject.take_off(plane)).to eq("Airborne")
    end

    it "rejects edge cases: Airborne plane trying to take off" do
      allow(plane).to receive(:location).and_return("Airborne")

      expect { subject.take_off(plane) }.to raise_error("Cannot take off. Plane already airborne")
    end

    it "rejects edge cases: Grounded plane trying to land" do
      allow(plane).to receive(:location).and_return(subject)

      expect { subject.land(plane) }.to raise_error("Cannot land. Plane already on the ground")
    end

    it "rejects edge cases: Planes cannot take off from airports that they aren't at" do
      airport2 = Airport.new
      allow(plane).to receive(:location).and_return(subject)

      expect { airport2.take_off(plane) }.to raise_error("Plane at wrong airport")
    end

  end

  context "The weather is good but there is no space in the hanger" do

    it "can prevent landing when the hanger is full" do
      airport = Airport.new(0)

      allow(airport).to receive(:bad_weather?).and_return(false)
      allow(airport).to receive(:hanger_full?).and_return(true)

      allow(plane).to receive(:location).and_return("Airborne")
      allow(plane).to receive(:grounded)

      expect { airport.land(plane) }.to raise_error("The plane can't land because the hanger is full")
    end
  end

  context "The weather is bad but there's space in the hanger" do

    before(:each) do
      allow(subject).to receive(:bad_weather?).and_return(true)
      allow(subject).to receive(:hanger_full?).and_return(false)
    end

    it "can prevent take off when there is bad weather" do
      allow(plane).to receive(:location).and_return(subject)
      expect { subject.take_off(plane) }.to raise_error("The weather is too bad to fly")
    end

    it "can prevent landing when there is bad weather" do
      allow(plane).to receive(:location).and_return("Airborne")
      expect { subject.land(plane) } .to raise_error("The weather is too bad to land")
    end
  end
end

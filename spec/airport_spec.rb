require "./lib/airport"

describe Airport do

  let(:plane) {double("Plane", land_at: :airport)}

  describe "#land" do

    it "raises an error if you try to land a plane that has already landed" do
      allow(subject).to receive(:weather_conditions) { 6 }
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error ("Plane already landed")
      
    end

    it "gives an error message if capacity set to 20 and we try and land a 21st plane" do
      airport = Airport.new(airport, 20)
      allow(airport).to receive(:weather_conditions) { 6 }
      expect{ 21.times {airport.land(Plane.new)} }.to raise_error ("Airport full, plane cannot land yet")
    end

    it "raises an error message if weather conditions stormy" do
      allow(subject).to receive(:weather_conditions) { 9 }
      expect { subject.land(plane) }.to raise_error ("It is too stormy to take off or land right now")
    end

    it "raises error if plane landed at other airport already" do
      airport1 = Airport.new(airport1)
      airport2 = Airport.new(airport2)
      allow(airport1).to receive(:weather_conditions) { 6 }
      airport1.land(plane)
      allow(airport2).to receive(:weather_conditions) { 6 }
      allow(plane).to receive(:land_at).and_raise("Plane already landed at another airport")
      expect { airport2.land(plane) }.to raise_error ("Plane already landed at another airport")
    end 

  end

  describe "#take_off" do
    it "instructs a plane to take off if currently landed at airport and confirms it has taken off with a message" do
      allow(subject).to receive(:weather_conditions) { 6 }
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "Plane has taken off"
    end

    it "raises an error message if plane is not at the airport" do
      allow(subject).to receive(:weather_conditions) { 6}
      expect{ subject.take_off(plane)}.to raise_error ("Plane not currently landed at this airport")
    end

    it "raises an error message if weather conditions stormy" do
      allow(subject).to receive(:weather_conditions) { 6 }
      subject.land(plane)
      allow(subject).to receive(:weather_conditions) { 9 }
      expect { subject.take_off(plane) }.to raise_error ("It is too stormy to take off or land right now")
    end

  end


end
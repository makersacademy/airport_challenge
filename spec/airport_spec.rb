require 'airport'

describe Airport do
  let(:plane) { double :plane }
  before do allow(plane).to receive_messages(:location => "Airborne",
      :flying? =>true)
  end
  describe "#land" do
    it "expects to see a plane in its hangar after telling it to land" do
      expect(subject.land(plane).last).to eq plane
    end

    it "prevents incoming planes from exceeding the hangar's capacity" do
      subject.sunny_weather
      Airport::DEFAULT_CAPACITY.times {
        plane2 = double(:plane)
        allow(plane2).to receive_messages(:flying? => true,
          :location => "Airborne")
        subject.land(plane2) }
      expect { subject.land(plane) }.to raise_error "Unable to land plane: max capacity has been reached."
    end

    it "prevents incoming planes from landing if the weather is stormy" do
      subject.cloud_seeding
      expect { subject.land(plane) }.to raise_error "Unable to land plane: weather is stormy."
    end

    it "only allows planes to land if in flight and not in an airport" do
      allow(plane).to receive(:flying?).and_return(false)
      allow(plane).to receive(:location).and_return(Airport.new)
      expect { subject.land(plane) }.to raise_error "Unable to land plane: plane is either not in flight or is already in an airport."
    end

  end

  describe "#capacity" do
    it "supports airports to adjust capacity as and when required" do
      airport = Airport.new(20)
      airport.sunny_weather
      landing_proc = proc{
        plane2 = double(:plane)
        allow(plane2).to receive_messages(:flying? => true,
          :location => "Airborne")
        airport.land(plane2)
      }
      20.times { landing_proc[] }
      expect{airport.land(plane)}.to raise_error "Unable to land plane: max capacity has been reached."
      airport.capacity = 40
      20.times { landing_proc[] }
      expect{airport.land(plane)}.to raise_error "Unable to land plane: max capacity has been reached."
    end
  end
  describe "#take_off" do

    before(:each) do
      subject.sunny_weather
      allow(plane).to receive(:location).and_return("Airborne","Not-Airborne")
      allow(plane).to receive(:flying?).and_return(true,false)
    end
    it "expects to see a plane has left its hangar after telling it to take-off" do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it "prevents planes from taking off if the weather is bad" do
      subject.land(plane)
      subject.cloud_seeding
      expect {subject.take_off(plane)}.to raise_error "Unable to take-off: weather is stormy."
    end

    it "only allows planes that are in the aiport to take-off from that airport and makes sure they are not airborne" do
      airport = Airport.new
      allow(plane).to receive(:location).and_return("Airborne",airport)
      allow(plane).to receive(:flying?).and_return(true,false)
      airport.sunny_weather
      airport.land(plane)
      expect {subject.take_off(plane)}.to raise_error "Unable to take-off: this plane is not in this airport!"
    end

  end

end
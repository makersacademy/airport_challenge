require 'airport'
require 'weather'

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) {double :plane, landed?: false}
  let(:weather) {double :weather}

  describe "#landing" do
    it "should land a new plane into the airport" do
      airport.land(plane)
      expect(airport.planes).to eq 1
    end

    it "confirms when a plane has landed" do
      expect(plane).to receive(:land)
      airport.land(plane)
    end

    context '#stormy' do
      it 'raises an error' do
        allow(weather).to receive(:stormy?).and_return true
      end

      it "does not let a plane land if it is stormy" do
        # expect(airport.land(plane)).to eq true
        expect { airport.land(plane) }.to raise_error("The weather's shite today, no landing!")
      end
    end

    it "does not let a plane land if over capacity" do
       airport.set_capacity.times{airport.land(plane)}
       expect{airport.land(plane)}.to raise_error("The airport is at maximum capacity.")
    end
  end

  describe "#takeoff" do
    it "should confirm that a plane has taken off from the airport" do
      expect(plane.taken_off?).to eq true
    end

    it "should not allow planes to take off if there is no plane scheduled to take off" do
      expect {airport.take_off}.to raise_error("There is no plane scheduled to take off")
    end

    it "does not let a plane take off if it is stormy" do
      expect(plane.stormy?).to eq true
    end
  end

end

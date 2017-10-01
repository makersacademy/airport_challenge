require 'plane'
describe Plane do

  let(:weather) { double(:weather, stormy?: true) }
  let(:airport) { double(:airport, accept_plane: nil) }

  describe "#landing" do

    it "should not land when the weather is stormy" do
      expect { subject.land(weather.stormy?) }.to raise_error("Weather stormy -> can't land!")
    end

    context "A landed plane" do
      it "should report that is in an airport" do
        stormy = false
        subject.land(stormy)
        expect(subject.at_airport).to eq true
      end
    end

  end

  describe "#taking off" do

    it "should report that it is no longer at the airport when taken off" do
      subject.take_off
      expect(subject.at_airport).to eq false
    end

    it "should not take off when the weather is stormy" do
      expect { subject.take_off(weather.stormy?) }.to raise_error("Weather stormy -> can't take off!")
    end

  end

end

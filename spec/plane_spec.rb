require 'plane'
describe Plane do

  describe "#landing" do

    it "should not land when the weather is stormy" do
      expect { subject.land(true) }.to raise_error("Weather stormy -> can't land!")
    end

    context "A landed plane" do
      it "should report that is in an airport" do
        subject.land(false)
        expect(subject.at_airport).to eq true
      end
    end

  end

  describe "#taking off" do

    it "should report that it is no longer at the airport when taken off" do
      subject.take_off(false)
      expect(subject.at_airport).to eq false
    end

    it "should not take off when the weather is stormy" do
      expect { subject.take_off(true) }.to raise_error("Weather stormy -> can't take off!")
    end

  end

end

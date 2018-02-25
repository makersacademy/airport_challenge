require './lib/airport.rb'

describe Airport do
  boeing747 = Plane.new

  it { should respond_to(:land, :take_off, :confirmation_of_departure) }

  context "When the weather is sunny" do
    it "lands a plane" do
      allow(subject).to receive(:observe_weather) { :sunny }
      result = subject.land(boeing747)
      expect(result).to eq [boeing747]
    end
  end

  context "When the weather is stormy" do
    it "does not land a plane" do
      allow(subject).to receive(:observe_weather) { :stormy }
      result = subject.land(boeing747)
      expect(result).to be_empty
    end
  end

  context "When the last airplane takes off" do
    it "leaves an empty hangar" do
      subject.land(boeing747)
      result = subject.take_off(boeing747)
      expect(result).to be_empty
    end
  end

  context "When confirming an airplane departure" do
    before { allow(subject).to receive(:observe_weather) { :sunny } }

    context "When the airplane took off" do
      it "returns true" do
        subject.land(boeing747)
        subject.take_off(boeing747)
        expect(subject.confirmation_of_departure(boeing747)).to be true
      end
    end

    context "When the airplane did not take off" do
      it "returns false" do
        subject.land(boeing747)
        expect(subject.confirmation_of_departure(boeing747)).to be false
      end
    end
  end
end

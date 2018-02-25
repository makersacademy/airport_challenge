require './lib/airport.rb'

describe Airport do
  boeing747 = Plane.new

  it { should respond_to(:full?, :observe_weather, :land, :take_off, :confirmation_of_departure) }

  context "When checking the hangar capacity" do
    context "and it is full" do
      it "returns true" do
        allow(subject).to receive(:observe_weather) { :sunny }
        20.times do
          subject.land(boeing747)
        end
        result = subject.full?
        expect(result).to be true
      end
    end

    context "and it is not full" do
      it "returns false" do
        result = subject.full?
        expect(result).to be false
      end
    end
  end

  context "When observing the weather" do
    context "and rand is not zero" do
      before { srand(1) }
      it "is sunny" do
        result = subject.observe_weather
        expect(result).to eq :sunny
      end
    end

    context "and rand is zero" do
      before { srand(0) }
      it "is stormy" do
        result = subject.observe_weather
        expect(result).to eq :stormy
      end
    end
  end

  context "When the weather is sunny" do
    it "lands a plane" do
      allow(subject).to receive(:observe_weather) { :sunny }
      result = subject.land(boeing747)
      expect(result).to eq [boeing747]
    end

    it "lets the last airplane take off" do
      allow(subject).to receive(:observe_weather) { :sunny }
      subject.land(boeing747)
      result = subject.take_off(boeing747)
      expect(result).to be_empty
    end
  end

  context "When the weather is stormy" do
    it "does not land a plane" do
      allow(subject).to receive(:observe_weather) { :stormy }
      result = subject.land(boeing747)
      expect(result).to be_empty
    end

    it "does not let the last airplane take off" do
      allow(subject).to receive(:observe_weather) { :sunny }
      subject.land(boeing747)
      allow(subject).to receive(:observe_weather) { :stormy }
      result = subject.take_off(boeing747)
      expect(result).to eq [boeing747]
    end
  end

  context "When the hangar is full" do
    it "raises an error" do
      allow(subject).to receive(:observe_weather) { :sunny }
      20.times do
        subject.land(boeing747)
      end
      expect { subject.land(boeing747) }.to raise_error("Sorry, the hangar is full.")
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

require "plane"

describe Plane do

  let(:Weather) { double :Weather }
  let(:airport) { double :airport }
=begin
  describe "#everything_fine?" do
    it "return true when is not stormy and the airport have space" do
      allow(Weather).to receive(:stormy?).and_return(false)
      allow(airport).to receive(:full?).and_return(false)
      expect(subject.everything_fine?).to eq true
    end
    it "return false when is not stormy and the airport is full" do
      allow(Weather).to receive(:stormy?).and_return(false)
      allow(airport).to receive(:full?).and_return(true)
      expect(subject.everything_fine?).to eq false
    end

    it "return false when is stormy and the airport have space" do
      allow(Weather).to receive(:stormy?).and_return(true)
      allow(airport).to receive(:full?).and_return(false)
      expect(subject.everything_fine?).to eq false
    end

    it "return false when is stormy and the airport is full" do
      allow(Weather).to receive(:stormy?).and_return(true)
      allow(airport).to receive(:full?).and_return(true)
      expect(subject.everything_fine?).to eq false
    end
  end
=end
  describe "#land" do
    let(:weather) { double :weather, stormy?: false }
    let(:airport) { double :airport, full?: false, planes: [], landed: [] }

    it { is_expected.to respond_to(:land).with(1).argument }

    it "lands a plane when requested and weather is clear and there is space in the airport" do
      # allow(Weather).to receive(:stormy?).and_return(false)
      # allow(airport).to receive(:full?).and_return(false)
      # allow(airport).to receive(:planes).and_return([])
      plane = Plane.new(airport, weather)
      expect(plane.land(airport)).to include()
    end

    it "reject landing when wheather is stormy and airport have space" do
      allow(weather).to receive(:stormy?).and_return(true)
      # allow(airport).to receive(:full?).and_return(false)
      # allow(airport).to receive(:planes).and_return([])
      plane = Plane.new(airport, weather)
      expect { plane.land(airport) }.to raise_error 'Unable to land'
    end

    it "reject landing when weather is not stormy and airport is full" do
      allow(Weather).to receive(:stormy?).and_return(false)
      allow(airport).to receive(:full?).and_return(true)
      allow(airport).to receive(:planes).and_return([])
      expect { subject.land(airport) }.to raise_error 'Unable to land'
    end

    it "reject landing when airport is full and weather stormy" do
      allow(Weather).to receive(:stormy?).and_return(true)
      allow(airport).to receive(:full?).and_return(true)
      allow(airport).to receive(:planes).and_return([])
      expect { subject.land(airport) }.to raise_error 'Unable to land'
    end
  end

  describe "#take_off" do
    let(:weather) { double :weather, stormy?: false }
    let(:airport) { double :airport, full?: false, planes: [], landed: [], departed: true }

    it "takes off from the airport in wich is and weather is not stormy" do
      subject.land(airport)
      expect(subject.take_off(airport)).to eq "Taking off"
    end

    it "rise an error when is not in the given airport" do
      subject.land(airport)
      expect { subject.take_off("Wrong airport") }.to raise_error "Not in such airport"
    end

    it "reject take off when is in the right airpot but weather is stormy" do
      subject.land(airport)
      allow(Weather).to receive(:stormy?).and_return(true)
      expect { subject.take_off(airport) }.to raise_error "Unable to take off"
    end

    it "rise an error when is flying" do
      allow(Weather).to receive(:stormy?).and_return(false)
      expect { subject.take_off(airport) }.to raise_error "Alredy flying"
    end
  end
end

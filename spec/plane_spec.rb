require './lib/plane'

describe Plane do
  let(:airport) { double("airport") }

    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it { is_expected.to respond_to(:flying?)}
  
    describe "#land" do
      it "lands the plane" do
        allow(airport).to receive(:receive).and_return(true)
        allow(airport).to receive(:full?).and_return(false)
        subject.land(airport)
        expect(subject.flying?).to eq false
      end

      it "does not land the plane when the airport is full" do
        allow(airport).to receive(:full?).and_return(true)
        expect{ subject.land(airport) }.to raise_error("Airport is full.")
      end

    
    end

    describe "#take_off" do
      it "takes off" do
        allow(airport).to receive(:full?).and_return(false)
        allow(airport).to receive(:receive).and_return(true)
        allow(airport).to receive(:release).and_return(true)
        subject.land(airport)
        subject.take_off(airport)
        expect(subject.flying?).to eq true
      end

    end
end
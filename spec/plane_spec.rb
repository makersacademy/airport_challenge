require './lib/plane'

describe Plane do
  let(:airport) { double("airport") }

    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:flying?)}
  
    describe "#land" do
      it "lands the plane" do
        allow(airport).to receive(:receive).and_return(true)
        subject.land(airport)
        expect(subject.flying?).to eq false
      end
    end
end
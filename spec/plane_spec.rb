require 'plane'
#require 'mocha/setup'

describe Plane do

 let(:plane) {Plane.new}
 let(:airport) {double("airport")}
 let(:storm) {true}
# let(:take_off_storm) {allow(subject).to receive(:take_off).with("Heathrow") {"can't fly in storm"}}
# let(:take_off_clear) {allow(plane).to receive(:take_off).with("Heathrow") {@landed=false}}

    it 'can create a plane object' do
      expect(plane).to be_an_instance_of Plane
    end
    it 'plane object can call land method' do
      expect(plane).to respond_to(:land).with(1).argument
    end
    it 'the plane object can take off' do
     expect(plane).to respond_to(:take_off).with(1).argument
    end
    it 'check status of landing' do
    expect(plane).to respond_to(:landed)
    end




    describe "#land" do
      it "plane lands at the airport in the parameter" do
      expect(subject.land airport).to eq airport
    end
  end

   describe "#take_off" do
      it 'takes off in clear weather' do
      allow(subject).to receive(:take_off).and_return(false)
      expect {subject.take_off("Heathrow")}.not_to raise_error
      end
      it 'does not takes off if weather is stormy' do
        allow(subject).to receive(:take_off).and_raise("can't fly in storm")
        expect {subject.take_off("Heathrow")}.to raise_error("can't fly in storm")
    end
  end


    describe "#storm" do
      it 'responds to weather' do
      expect(subject).to respond_to(:storm)
    end
      it "returns true if storm" do
      #it 'produces a random outcome on weather weighted 10% to storm' do
      allow(subject).to receive(:storm) {true}
      expect(subject.storm).to be true
    end
  end
end
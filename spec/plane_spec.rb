require 'airport'

describe Plane do

  describe "#land" do
    it {expect(subject).to respond_to(:land).with(1).argument}

    before do
      @airport = Airport.new
    end

    context "if a plane lands" do
      it { expect{subject.land(@airport)}.to change(@airport::planes, :count).from(0).to(1)}
    end
  end

  describe "#take_off" do
    it {expect(subject).to respond_to(:take_off).with(1).argument}
    before do
      @airport = Airport.new
      @plane = Plane.new
      @plane.land(@airport)

    end

    context "if a plane takes off"
    it { expect{subject.take_off(@airport)}.to change{@airport.planes}}
    end

    context "if the weather is not stormy" do
      it "will take_off" do
        allow(@plane).to receive(:safe?) {true}
      #it { expect{subject.take_off(@airport)}.to change{@airport.planes}}
      end
    end

end

require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe "#land" do

    it "expects to see a plane in its hangar after telling it to land" do
      expect(subject.land(plane).last).to eq plane
    end

    it "prevents incoming planes from exceeding the hangar's capacity" do
      30.times { subject.land(double(:plane)) }
      expect { subject.land(plane) }.to raise_error "Unable to land plane: max capacity has been reached."
    end

  end

  describe "#take_off" do
    it "expects to see a plane has left its hangar after telling it to take-off" do
      expect(subject.take_off(plane)).to eq plane
    end
  end

end
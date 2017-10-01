require 'airport'
describe Airport do
  let(:plane) { double(:plane, land: nil, take_off: nil) }
  let(:weather) { double(:weather, stormy?: false) }

  describe "#take off and landing of planes" do
    context "capacity issues" do
      it "should not accept planes if the aiport is full" do
        subject.capacity.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error("Airport full -> can't accept planes!")
      end

      it "should raise an error if there are no planes and the take_off method is called" do
        expect { subject.take_off }.to raise_error "No planes at the airport!"
      end
    end

    it "should report a plane is in the airport if it has landed" do
      subject.land(plane)
      expect(subject.planes.include?(plane)).to eq true
    end

    it "should report that a plane is no longer in the airport if it has taken off" do
      subject.land(plane)
      subject.take_off
      expect(subject.planes.empty?).to eq true
    end

  end

  describe "#capacity" do

    let(:subject) { Airport.new(5) }

    it "when airport object is being instantiated, should accept an argument of capacity" do
      expect(subject.capacity).to eq 5
    end

  end

end

require 'airport'

describe Airport do

  it { should respond_to(:land).with(1).argument }

  it { should respond_to(:take_off) }

  describe '#land' do

    it "should land a plane" do
      # not sure how to make this test pass / if it needs to be changed
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

  end

  describe '#take_off' do

    it "should confirm that plane has left the airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq "#{plane} has left the airport"
    end

    context "when a plane tries to take off without landing initially" do
      it "should raise an error" do
        expect { subject.take_off }.to raise_error "No plane at the airport"
      end
    end

    context "when a plan tries to take off twice without landing in between" do
      it "should raise an error" do
        plane = Plane.new
        subject.land(plane)
        subject.take_off
        expect { subject.take_off }.to raise_error "No plane at the airport"
      end
    end

  end

end

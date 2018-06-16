require 'airport'

describe Airport do

  it { should respond_to(:land).with(1).argument }

  it { should respond_to(:take_off) }

  describe '#land' do

    it "should land a plane" do
      # before I required plane.rb in airport
      # expected unitialized constant in the test
      # didn't get that though...
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

  end

  describe '#take_off' do
    context "when plane has landed" do
      it "should confirm that plane has left the airport" do
        plane = Plane.new
        subject.land(plane)
        expect(subject.take_off).to eq "#{plane} has left the airport"
      end
    end
    context "when plane has not yet landed" do
      it "should raise error" do
        expect { subject.take_off }.to raise_error "No plane at the airport"
      end
    end
  end


end

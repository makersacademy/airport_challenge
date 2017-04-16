require 'airport'

describe Airport do
  let(:plane) { double :plane }
  before(:each) do
    allow(subject).to receive(:stormy?) { false }
    allow(plane).to receive(:location)
    allow(plane).to receive(:landing)
    allow(plane).to receive(:taking_off)
    allow(plane).to receive(:location) { :up_in_the_air }
    allow(plane).to receive(:name) { :test_plane }
  end

  describe "#land" do
    it "should print a confirmation once a plane landed" do
      expect { subject.land(plane) }.to output("The #{plane.name} landed succesfully").to_stdout
    end

    it "should be able to land a plane" do
      subject.land(plane)
      expect(subject.planes_in_airport.include? plane.name).to be true
    end
  end

    describe "#take_off" do
      it "should be able to take off planes" do
        subject.land(plane)
        allow(plane).to receive(:location) { :airport }
        expect { subject.take_off(plane) }.to output("The #{plane.name} took off succesfully").to_stdout
      end

      it "should be able to take off planes" do
        allow(subject).to receive(:stormy?) { false }
        expect(subject.planes_in_airport.include? plane.name).to be false
      end
    end

    describe "#landing criteria" do
      it "should fail when plane is in the airport" do
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error "#{plane.name} already landed in this airport"
      end

      it "should fail when plane is not in the air" do
        allow(plane).to receive(:location) { :airport }
        expect { subject.land(plane) }.to raise_error "#{plane.name} is not in the air"
      end

      it "should fail when airport is full" do
        subject.change_capacity(1)
        subject.land(plane)
        allow(plane).to receive(:name) { :test_plane1 }
        expect { subject.land(plane) }.to raise_error "Can't land as the airport is full"
      end

      it "should fail when weather is stormy" do
        allow(subject).to receive(:stormy?) { true }
        expect { subject.land(plane) }.to raise_error "Can't land due to stormy weather"
      end
    end

    describe "#taking_off_criteria" do
      it "should fail when plane is not at that airport" do
        expect { subject.take_off(plane) }.to raise_error "#{plane.name} is not in this aiport"
      end

      it "should fail when the weather is stormy" do
        subject.land(plane)
        allow(plane).to receive(:location) { subject.name }
        allow(subject).to receive(:stormy?) { true }
        expect { subject.take_off(plane)}.to raise_error "Can't take off due to stormy weather"
      end
    end
    
    describe "#change_capacity" do
      it "should change the capacity of the airport" do
        subject.change_capacity(5)
        expect(subject.capacity).to eq 5
      end
    end
end

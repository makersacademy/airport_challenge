require "airport"
require "plane"

describe Airport do
  let(:plane) { instance_double(Plane) }
  let(:weather) { class_double(Weather).as_stubbed_const }
  
  before do
    allow(plane).to receive(:instance_of?).with(Plane).and_return(true)
    allow(plane).to receive(:landed)
    allow(plane).to receive(:in_flight)
    allow(plane).to receive(:flying).and_return(true)
    allow(weather).to receive(:stormy?).and_return(false)
  end

  describe "#land method" do
    context "the weather is not stormy" do
      it "should instruct a plane to land at the airport" do
        subject.land(plane)
        expect(subject.landed_planes.last).to eq(plane)
      end

      it "should only allow planes to land" do
        expect { subject.land("helicopter") }.to raise_error "This is not a plane"
      end

      it "should not allow landed planes to land again" do
        subject.land(plane)
        expect { subject.land(plane) }.to raise_error "This plane has already landed"
      end

      it "should not allow planes not in flight to land" do
        allow(plane).to receive(:flying).and_return(false)
        expect { subject.land(plane) }.to raise_error "This plane has landed somewhere else"
      end

      it "should not allow planes to land when the airport is full" do
        subject.capacity.times { subject.landed_planes.push(double(Plane)) }
        expect { subject.land(plane) }.to raise_error "The airport is full"
      end

      it "should not allow planes to land when the weather is stormy" do
        allow(weather).to receive(:stormy?).and_return(true)
        expect { subject.land(plane) }.to raise_error
      end
    end

    context "the weather is stormy" do    
      it "should allow planes to land when the weather is not stormy" do
        expect { subject.land(plane) }.not_to raise_error "No landings allowed while the weather is stormy"
      end
    end
  end

  describe "#take_off method" do
    context "the weather is not stormy" do
      it "should instruct a plane to take off from the airport" do
        subject.landed_planes = [plane]
        subject.take_off(plane)
        expect(subject.landed_planes).not_to include(plane)
      end

      it "should only allow planes to take off" do
        expect { subject.take_off("helicopter") }.to raise_error "This is not a plane"
      end

      it "should only allow landed planes to take off" do
        expect { subject.take_off(plane) }.to raise_error "This plane is not at the airport"
      end

      it "should allow planes to take off when the weather is not stormy" do
        subject.landed_planes = [plane]
        expect { subject.take_off(plane) }.not_to raise_error "No take offs allowed while the weather is stormy"
      end
    end

    context "the weather is stormy" do
      it "should not allow planes to take off when the weather is stormy" do
        allow(weather).to receive(:stormy?).and_return(true)
        expect { subject.take_off(plane) }.to raise_error "No take offs allowed while the weather is stormy"
      end
    end
  end
end

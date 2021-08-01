require "./lib/airport.rb"
require "./lib/plane.rb"
require "./lib/weather.rb"

describe Airport do
  let(:plane) { Plane.new }
  let(:weather) { class_double(Weather).as_stubbed_const }
  
  context "#land method" do
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

    it "should not allow planes to land when the airport is full" do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(plane) }.to raise_error "The airport is full"
    end

    it "should not allow planes to land when the weather is stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error "No landings allowed while the weather is stormy"
    end

    it "should allow planes to land when the weather is not stormy" do
      allow(weather).to receive(:stormy?).and_return(false)
      expect { subject.land(plane) }.not_to raise_error "No landings allowed while the weather is stormy"
    end
  end

  context "#take_off method" do
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

    it "should not allow planes to take off when the weather is stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error "No take offs allowed while the weather is stormy"
    end

    it "should allow planes to take off when the weather is not stormy" do
      allow(weather).to receive(:stormy?).and_return(false)
      expect { subject.land(plane) }.not_to raise_error "No take offs allowed while the weather is stormy"
    end
  end
end

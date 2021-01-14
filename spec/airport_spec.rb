require 'airport'

describe Airport do
  let(:plane) { Plane.new }
  let(:plane2) { Plane.new }

  describe ".capacity" do
    it 'has a default capacity of 20' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can change the capacity for new airports' do
      airport = Airport.new(100)
      expect(airport.capacity).to eq 100
    end
  end

  describe ".land" do
    it 'responds to land' do
      allow(subject.weather).to receive(:weather_report) { "sunny" }
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'responds to takeoff' do
      allow(subject.weather).to receive(:weather_report) { "sunny" }
      expect(subject).to respond_to(:takeoff).with(1).argument
    end

    it 'lets planes can land' do
      allow(subject.weather).to receive(:weather_report) { "sunny" }
      expect(subject.land(plane)).to eq [plane]
    end

    it 'stores the planes at the airport' do
      allow(subject.weather).to receive(:weather_report) { "sunny" }
      subject.land(plane)
      expect(subject.planes_in_airport).to eq [plane]
    end

    it "doesn't let planes land in storms" do
      allow(subject.weather).to receive(:weather_report) { "stormy" }
      expect { subject.land(plane) }.to raise_error "Weather is too bad for landing/takeoff"
    end

    it "doesn't let planes land if at full capacity" do
      airport = Airport.new(1)
      allow(airport.weather).to receive(:weather_report) { "sunny" }
      airport.land(plane2)
      expect { airport.land(plane) }.to raise_error "Airport at full capacity"
    end
  end

  describe ".takeoff" do
    it 'lets planes takeoff' do
      allow(subject.weather).to receive(:weather_report) { "sunny" }
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

    it 'confirms planes have taken off after takeoff' do
      allow(subject.weather).to receive(:weather_report) { "sunny" }
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes_in_airport).to eq []
    end

    it "doesn't let planes takeoff if there are none in airport" do
      allow(subject.weather).to receive(:weather_report) { "sunny" }
      expect { subject.takeoff(plane) }.to raise_error "No planes available for takeoff"
    end

    it "doesn't let planes take off in storms" do
      allow(subject.weather).to receive(:weather_report) { "stormy" }
      expect { subject.takeoff(plane) }.to raise_error "Weather is too bad for landing/takeoff"
    end

    it "planes can only take off from airports they are in" do
      allow(subject.weather).to receive(:weather_report) { "sunny" }
      airport2 = Airport.new
      allow(airport2.weather).to receive(:weather_report) { "sunny" }
      subject.land(plane)
      airport2.land(plane2)
      expect { airport2.takeoff(plane) }.to raise_error "Plane not at this airport"
    end

    it 'planes that are already flying cannot take off' do
      allow(subject.weather).to receive(:weather_report) { "sunny" }
      subject.land(plane)
      subject.land(plane2)
      subject.takeoff(plane)
      expect { subject.takeoff(plane) }.to raise_error "Plane not at this airport"
    end
  end
end
# describe "edge cases" do
#     it 'planes that are already flying cannot be in another airport' do
#       airport = Airport.new
#       plane2 = Plane.new
#       airport.land(plane)
#       airport.land(plane2)
#       airport.takeoff(plane)
#       expect(airport.planes_in_airport).to eq [plane2]
#     end
#
#     it 'planes that have landed cannot land again' do
#       airport = Airport.new
#       airport.land(plane)
#       expect { airport.land(plane) }.to raise_error "Plane is not flying"
#     end
#
#     it 'planes that have landed in one airport cannot land in another' do
#       airport = Airport.new
#       airport2 = Airport.new
#       airport.land(plane)
#       expect { airport2.land(plane) }.to raise_error "Plane is not flying"
#     end
#   end
# end

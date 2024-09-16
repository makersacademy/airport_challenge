require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do
  
  let(:fine_weather) { instance_double Weather, stormy?: false }
  let(:stormy_weather) { instance_double Weather, stormy?: true }
  let(:subject) { described_class.new }
  let(:plane) { Plane.new }
  let(:plane_two) { Plane.new }
  
  describe "#land" do
    it "instructs a plane to land at an airport" do
      expect(subject.land(plane, fine_weather)).to eq(plane)
    end

    context "airport is full" do
      it "raises and error when airport is full" do
        Airport::DEFAULT_CAPACITY.times { subject.land(plane, fine_weather) }
        expect { subject.land(plane, fine_weather) }.to raise_error 'Airport is full'
      end
    end

    context "stormy weather - no landing possible" do
      it "raises an error when plane tries to land during a storm" do
        expect { subject.land(plane, stormy_weather) }.to raise_error 'Too stormy to land.'
      end
    end

  end
  
  describe "#takeoff" do

    it "instructs a plane to take off" do
      subject.land(plane, fine_weather)
      expect(subject.takeoff(plane, fine_weather)).to eq plane
    end

    context "stormy weather - taking off not possible" do
      it "raises an error when plane tries to take off during a storm" do
        subject.land(plane, fine_weather)
        expect { subject.takeoff(plane, stormy_weather) }.to raise_error 'Too stormy to take off.'
      end
    end

    context "airport empty - there's no plane that could take off" do
      it "raises an error when there are no planes in the airport" do
        expect { subject.takeoff(plane, fine_weather) }.to raise_error "There are no planes in the airport."
      end
    end

    context "plane is not in the airport, so it cannot take off from here" do
      it "raises an error when plane is not in the airport" do
        subject.land(plane, fine_weather)
        expect { subject.takeoff(plane_two, fine_weather) }.to raise_error "Plane cannot take off if it's not in the airport."
      end
    end

  end

  describe "#report_taking_off" do

    it "returns message that the plane has taken off" do
      subject.land(plane, fine_weather)
      subject.takeoff(plane, fine_weather)
      expect(subject.report_taking_off).to eq("The plane successfully took off.")
    end
    
  end

  it "sets capacity to default value" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end

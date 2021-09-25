require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do
  
  let(:fine_weather) { instance_double Weather, stormy?: false }
  let(:stormy_weather) { instance_double Weather, stormy?: true }

  it "instructs a plane to land at an airport" do
    plane = Plane.new
    expect(subject.land(plane, fine_weather)).to eq(plane)
  end

  it "instructs a plane to take off" do
    plane = Plane.new
    subject.land(plane, fine_weather)
    expect(subject.takeoff(plane, fine_weather)).to eq plane
  end

  it "raises and error when airport is full" do
    plane = Plane.new
    Airport::DEFAULT_CAPACITY.times { subject.land(plane, fine_weather) }
    expect { subject.land(plane, fine_weather) }.to raise_error 'Airport is full'
  end

  it "raises an error when plane tries to land during a storm" do
    plane = Plane.new
    expect { subject.land(plane, stormy_weather) }.to raise_error 'Too stormy to land.'
  end

  it "raises an error when plane tries to take off during a storm" do
    plane = Plane.new
    subject.land(plane, fine_weather)
    expect { subject.takeoff(plane, stormy_weather) }.to raise_error 'Too stormy to take off.'
  end

  it "sets capacity to default value" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "raises an error when there are no planes in the airport" do
    plane = Plane.new
    expect { subject.takeoff(plane, fine_weather) }.to raise_error "There are no planes in the airport."
  end

  describe "#report_taking_off" do

    it "returns message that the plane has taken off" do
      plane = Plane.new
      subject.land(plane, fine_weather)
      subject.takeoff(plane, fine_weather)
      expect(subject.report_taking_off).to eq("Plane is no longer at the airport.")
    end
    
  end

end

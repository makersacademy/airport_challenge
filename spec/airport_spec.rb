require 'airport'

describe Airport do
  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:undock).with(1).argument }
  it { is_expected.to respond_to(:docked?).with(1).argument }
  it { is_expected.to respond_to(:capacity) }
  it { is_expected.to respond_to(:full?) }
  it { is_expected.to respond_to(:weather_reporter) }
  
  it "has a default capacity" do
    expect(subject.capacity).to eq(described_class::DEFAULT_CAPACITY)
  end
  
  it "can have its default capacity overwritten" do
    subject = described_class.new(20)
    expect(subject.capacity).to eq(20)
  end
  
  it "has a weather_report of the WeatherReporter class" do
    expect(subject.weather_reporter).to be_a_kind_of(WeatherReporter)
  end
  
  describe "#planes" do
    it "returns an Array" do
      expect(subject.planes).to be_a_kind_of(Array)
    end
  end
  
  describe "#dock" do
    it "adds a plane to its list of planes" do
      srand(14)
      plane = Plane.new
      expect { subject.dock(plane) }
      .to change(subject, :planes).to include(plane)
    end
    
    it "raises an error if its stormy" do
      storm_reporter = instance_double(WeatherReporter, :check_weather => "Stormy")
      subject.instance_variable_set(:@weather_reporter, storm_reporter)
      plane = Plane.new
      expect { subject.dock(plane) }.to raise_error("It's too stormy to land.")
    end
  end
  
  describe "#undock" do
    it "removes a plane from its list of planes" do
      srand(14)
      plane = Plane.new
      subject.dock(plane)
      subject.undock(plane)
      expect(subject.planes).to_not include(plane)
    end
    
    it "raises an error if it is stormy" do
      srand(14)
      storm_reporter = instance_double(WeatherReporter, :check_weather => "Stormy")
      subject = described_class.new
      plane = Plane.new
      subject.dock(plane)
      subject.weather_reporter = storm_reporter
      expect { subject.undock(plane) }.to raise_error("It's too stormy to take off.")
    end
  end
  
  describe "#docked" do
    it "returns false if plane is NOT docked" do
      expect(subject.docked?(Plane.new)).to be false
    end
    
    it "returns true if a plane IS docked" do
      plane = Plane.new
      subject.dock(plane)
      expect(subject.docked?(plane)).to be true
    end
  end
  
  describe "#capacity" do
    it "returns an Integer" do
      expect(subject.capacity).to be_a_kind_of(Integer)
    end
  end
  
  describe "#full" do
    it "returns a bool" do
      expect(subject.full?).to be(true).or be(false)
    end
    
    it "returns false when the airport is under capacity" do
      expect(subject.full?).to be(false)
    end
    
    it "returns true when airport is full" do
      sun_reporter = instance_double(WeatherReporter, :check_weather => "Sunny")
      subject.weather_reporter = sun_reporter
      10.times { subject.dock(Plane.new) }
      expect(subject.full?).to be true
    end
  end
end
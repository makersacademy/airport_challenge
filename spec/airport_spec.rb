require 'airport'

shared_context 'sunny' do
  let(:subject) do
    port = Airport.new
    sun_reporter = instance_double(WeatherReporter, :check_weather => "Sunny")
    port.instance_variable_set(:@weather_reporter, sun_reporter)
    port
  end
end

describe Airport do

  it "has a default capacity" do
    expect(subject.capacity).to eq(described_class::DEFAULT_CAPACITY)
  end

  it "can have its default capacity overwritten" do
    subject = described_class.new(20)
    expect(subject.capacity).to eq(20)
  end

  describe "#planes" do
    it "returns an Array" do
      expect(subject.planes).to be_a_kind_of(Array)
    end
  end

  describe "#dock" do
    context "it is sunny" do
      include_context 'sunny'
      it "adds a plane to its list of planes" do
        plane = Plane.new
        expect { subject.dock(plane) }
        .to change(subject, :planes).to include(plane)
      end
    end

    it "raises an error if its stormy" do
      storm_reporter = instance_double(WeatherReporter, :check_weather => "Stormy")
      subject.instance_variable_set(:@weather_reporter, storm_reporter)
      plane = Plane.new
      expect { subject.dock(plane) }.to raise_error("It's too stormy to land.")
    end
  end

  describe "#undock" do
    context "it is sunny" do
      include_context 'sunny'
      it "removes a plane from its list of planes" do
        plane = Plane.new
        subject.dock(plane)
        subject.undock(plane)
        expect(subject.planes).to_not include(plane)
      end
    end

    it "raises an error if it is stormy" do
      # create WeatherReporter mocks that only return sunny or stormy
      storm_reporter = instance_double(WeatherReporter, :check_weather => "Stormy")
      sun_reporter = instance_double(WeatherReporter, :check_weather => "Sunny")

      # ensure that weather is sunny while plane is docked
      subject.instance_variable_set(:@weather_reporter, sun_reporter)
      plane = Plane.new
      subject.dock(plane)

      # ensure that weather is stormy while testing error raising for storms
      subject.instance_variable_set(:@weather_reporter, storm_reporter)
      expect { subject.undock(plane) }.to raise_error("It's too stormy to take off.")
    end
  end

  describe "#docked" do
    it "returns false if plane is NOT docked" do
      expect(subject.docked?(Plane.new)).to be false
    end

    context "it is sunny" do
      include_context 'sunny'
      it "returns true if a plane IS docked" do
        plane = Plane.new
        subject.dock(plane)
        expect(subject.docked?(plane)).to be true
      end
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

    context "it is sunny" do
      include_context 'sunny'
      it "returns true when airport is full" do
        sun_reporter = instance_double(WeatherReporter, :check_weather => "Sunny")
        subject.instance_variable_set(:@weather_reporter, sun_reporter)
        10.times { subject.dock(Plane.new) }
        expect(subject.full?).to be true
      end
    end
  end
end

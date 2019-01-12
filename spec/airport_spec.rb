require 'airport'

describe Airport do
  it { is_expected.to respond_to(:planes) }
  it "can instruct a PLANE to LAND" do
    allow(subject).to receive(:weather_report) { :sunny }
    p subject.weather_report
    expect(subject).to respond_to(:land).with(1).arguments
    expect { subject.land(Plane.new) }.to_not raise_error
  end

  it "stores LANDed planes in PLANES" do
    allow(subject).to receive(:weather_report) { :sunny }
    pointer = Plane.new
    subject.land(pointer)
    expect(subject.planes.include?(pointer)).to eq(true)
  end

  it "can instruct a PLANE to TAKEOFF in sunny weather" do
    allow(subject).to receive(:weather_report) { :sunny }
    expect(subject).to respond_to(:takeoff).with(1).arguments
    pointer = Plane.new
    subject.land(pointer)
    expect { subject.takeoff(pointer) }.to_not raise_error
  end

  it "only TAKEOFFs planes already in airport" do
    expect { subject.takeoff(Plane.new) }.to raise_error("Plane not found!")
  end

  it "no longer holds taken off PLANE in PLANES" do
    allow(subject).to receive(:weather_report) { :sunny }
    pointer = Plane.new
    subject.land(pointer)
    subject.takeoff(pointer)
    expect(subject.planes.include?(pointer)).to eq(false)
  end
  it "prohibits takeoff when WEATHER is stormy" do
    pointer = Plane.new
    subject.land(pointer)
    allow(subject).to receive(:weather_report) { :stormy }
    expect { subject.takeoff(pointer) }.to raise_error
  end
  it "prohibits landing when WEATHER is stormy" do
    pointer = Plane.new
    allow(subject).to receive(:weather_report) { :stormy }
    expect { subject.land(pointer) }.to raise_error
  end
end

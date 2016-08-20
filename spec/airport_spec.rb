require 'airport'
require 'weather_report_spec'
require 'plane'

describe Airport do
  include_examples "weather_report"

  subject {described_class.new}
  let(:plane) {double(:plane)}

  it "can harbour planes" do
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  it "has planes take off" do
    allow(subject).to receive(:weather_report) {"sunny"}
    subject.take_off
    expect(subject.planes).not_to include plane
  end

  it "stops planes taking off when stormy" do
    allow(subject).to receive(:weather_report) {"stormy"}
    expect{subject.take_off}.to raise_error "stormy day, no flying"
  end


  it "only lets a plane harbour once" do
    subject.land(plane)
    expect{subject.land(plane)}.to raise_error "plane already landed"
  end

  it "does not accept planes when full" do
      subject.capacity.times do
        plane = Plane.new ; #necessary as double sets off "plane already landed"
      subject.land(plane) end
      expect{subject.land(plane) #try land more than capacity
    }.to raise_error "airport full, find another lol"
  end

  it "allows controller to override default capacity" do
    big_airport = Airport.new(40)
    expect(big_airport.capacity).to eq(40)
  end
end

require 'airport'
require 'weather_report_spec'

describe Airport do
  include_examples "weather_report"

  subject {described_class.new}
  let(:plane) {double(:plane)}

  it "can harbour planes" do
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  it "has planes take off" do
    subject.take_off
    expect(subject.planes).not_to include plane
  end

  it "only lets harboured plans take off"

  it "only lets a plane harbour once"

  it "does not accept planes when full" do
      subject.capacity.times do
      subject.land(plane) end
      expect{subject.land(plane) #try land more than capacity
    }.to raise_error "airport full, find another lol"
  end

  it "allows controller to override default capacity" do
    big_airport = Airport.new(40)
    expect(big_airport.capacity).to eq(40)
  end
end

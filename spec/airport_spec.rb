require 'airport'
require 'weather'

describe Airport do
  let(:plane) {double(:plane)}

  it "instructs a plane to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "confirms the plane is in the airport" do
    # expect(subject.landed?(plane)).to eq plane
    subject.land(plane)
    expect(subject.in_airport).to include(plane)
  end

  it "instructs a plane to take off" do
    expect(subject).to respond_to(:take_off).with(2).argument
  end

  it "confirms the plane is airborne" do
    subject.take_off(plane, true)
    expect(subject.in_air).to include(plane)
  end

  it "raises unsafe error" do
    expect{subject.take_off(plane, false)}.to raise_error("It isn't safe to fly.")
  end
end

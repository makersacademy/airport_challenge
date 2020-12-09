require 'airport'

describe Airport do
  let(:zero_capacity_airport) { Airport.new(0) }

  it "Is an instance of the airport class" do
    expect(subject).to be_instance_of(Airport)
  end

  it "Should have no planes in hanger atfer instantiation" do
    expect(subject.planes_in_hangar.length).to eq(0)
  end

  it "Landing a plane will cause that plane to be in the hangar" do
    subject.land_plane("real plane")
    expect(subject.planes_in_hangar.length).to eq(1)
    expect(subject.planes_in_hangar[0]).to eq("real plane")
  end

  it "Telling a plane to take off after landing will cause it to not be in the hangar" do
    subject.land_plane("real plane")
    subject.takeoff_plane("real plane")
    expect(subject.planes_in_hangar.length).to eq(0)
  end

  it "Should have default capacity of 20" do
    expect(subject.capacity).to eq(20)
  end

  it "Should return true when asked if it has space and it does" do
    expect(subject.space?).to eq(true)
  end

  it "Should return false when asked if it has space and it doesn\'t" do
    expect(zero_capacity_airport.space?).to eq(false)
  end

  it "Should return either true or false when .good_weather? called" do
    expect([true, false]).to include(subject.good_weather?)
  end

end

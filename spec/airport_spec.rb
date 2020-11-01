require 'airport'

describe Airport do

  it "Is an instance of the airport class" do
    expect(subject).to be_instance_of(Airport)
  end

  it "Should have no planes in hanger atfer instantiation" do
    expect(subject.planes_in_hangar.length).to eq(0)
  end

  it "Should have default capacity of 20" do
    expect(subject.capacity).to eq(20)
  end

  it "Should return either true or false when .good_weather? called" do
    expect([true, false]).to include(subject.good_weather?)
  end

end

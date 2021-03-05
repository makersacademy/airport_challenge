require 'air_traffic'

describe AirTraffic do
  it "sends a message to land" do
    expect(subject.instruction).to eq("land")
  end
end

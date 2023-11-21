require "./lib/airport.rb"
describe Airport do
  it "checks that check_runway will not return nil when there are no plane in initial state" do
    expect(subject.check_runway.nil?).to eq(false)
  end

  it "checks that commit_runway will result in the first runway to be :blocked" do
    subject.commit_runway(Planes.new, :landing)
    expect(subject.runways[0][:status]).to eq(:blocked)
  end

  it "should show the default capacity is 40" do
    expect(subject.capacity).to eq(40)
  end
end

describe Airport do
  subject(:airport_1) { described_class.new(80) }
  it "should change the default capacity to 80" do
    expect(airport_1.capacity).to eq(80)
  end
end
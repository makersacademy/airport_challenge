require "./lib/airport.rb"
describe Airport do
  it "checks that check_runway will return nil when there are no plane in initial state" do
    expect(subject.check_runway.nil?).to eq(false)
  end

  it "checks that commit_runway will result in the first runway to be ocupied" do
    subject.commit_runway(Planes.new,:landing)
    expect(subject.runways[0][:status]).to eq(:blocked)
  end
end
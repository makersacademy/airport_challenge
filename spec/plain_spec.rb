require_relative '../lib/plane'
STATES = { landed: true, in_air: false }.freeze
subject = Plane.new
describe Plane do
  it "should have an id" do
    expect(subject.id).to eq('p1')
  end
  it "initial state is in air" do
    expect(subject.state).to eq(STATES[:in_air])
  end
end

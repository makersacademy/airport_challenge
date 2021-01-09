require 'plane'

describe Plane do
  it "checks whether plane responds to ready_to_fly" do
    expect(subject).to respond_to(:ready_to_fly)
  end

  it "checks if ready_to_fly is true" do
    expect(subject.ready_to_fly).to eq true
  end
end
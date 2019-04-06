require 'plane'

describe Plane do
  it {is_expected.to respond_to :working?}
  it "creates a plane" do
    expect(subject.working?).to eq(true)
  end
end

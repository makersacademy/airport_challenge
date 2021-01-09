require 'plane'

describe Plane do
  it "responds to flying?" do
    expect(subject).to respond_to :flying?
  end

  it "it asks and receives permission to land" do
    expect(subject.landing_permission).to eq true
  end

end

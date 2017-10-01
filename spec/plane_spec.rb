require 'plane'

describe Plane do
  it "responds to method land at an airport" do
    expect(subject).to respond_to(:land(#airport))
  end
end

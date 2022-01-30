require "airport"

describe Plane do
  it "is a plane that can be airborne" do
    expect(subject).to be_flying
  end
end

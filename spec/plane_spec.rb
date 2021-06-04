require "airport"
require "plane"

describe Plane do
  it "can confirm if departed" do
    expect(subject.departed?).to eq(false)
  end
end

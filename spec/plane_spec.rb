require 'plane'

describe Plane do
  it "lands at airport without error" do
    expect { subject.land_at(Airport.new) }.not_to raise_error
  end
end

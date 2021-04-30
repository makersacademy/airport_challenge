# planes can only take off from airports they are in;
# planes that are already flying cannot take off and/or be in an airport;
# planes that are landed cannot land again and must be in an airport, etc.

require 'plane'

describe Plane do

  it "responds to landed" do
    expect(subject).to respond_to :landed?
  end

end

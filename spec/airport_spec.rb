# Task https://github.com/pchan2/airport_challenge
require 'airport'

describe Airport do
  it "instructs a plane to land at an airport" do
    expect(subject.land).to eq "land plane"
  end

end

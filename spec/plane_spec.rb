require "plane.rb"

describe Plane do
  it { is_expected.to respond_to(:land) }   # <--user story 1

  it "should confirm that it is in the airport" do  # <--user story 1
    subject.land
    expect(subject.status_of_plane).to eq "in airport"
end

  it { is_expected.to respond_to(:take_off) } # <--user story 2

  it "should confirm that it is no longer in the airport" do  # <--user story 2
    subject.take_off
    expect(subject.status_of_plane).to eq "not in airport"
  end
end

require "passenger"

describe Passenger do
  it "has a checked in status" do
    expect(subject).to respond_to(:checked_in?)
  end
  it "can be checked in" do
    expect(subject.check_in).to be_checked_in
  end
end

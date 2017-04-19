require 'plane'

describe Plane do
  it "is flying on creation" do
    expect(subject).to be_flying
  end

  it "reacts to change of status" do
    expect {subject.flying(false)}.to change{subject.flying?}.from(true).to(false)
  end

end

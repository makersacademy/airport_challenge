require 'plane'

describe Plane do
  it "is landed on creation" do
    expect(subject).not_to be_flying
  end

  it "reacts to change of status" do
    expect {subject.flying(true)}.to change{subject.flying?}.from(false).to(true)
  end

end

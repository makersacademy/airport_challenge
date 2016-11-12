require "plane"

describe Plane do

  it "should return true if a plane is landed" do
    expect(subject.landed?).to be true
  end

  #it "should return false if a plane is in the air" do
  #  expect(subject.landed?).to be false
  #end
end

require 'plane'

describe Plane do
  it "should know when it is flying" do
    subject.fly
    expect(subject.flying?).to eq true
  end

  it "should know when it is landed" do
    subject.land
    expect(subject.landed?).to eq true
  end
end

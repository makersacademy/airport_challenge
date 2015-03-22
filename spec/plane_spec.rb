require 'plane'

describe Plane do

  it "has an airborne status when created" do
    expect(subject).to respond_to :airborne?
  end

  it "can take off" do
    expect(subject.take_off).to be_airborne
  end

  it "can land" do
    expect(subject.land).not_to be_airborne
  end

end

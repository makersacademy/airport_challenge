require 'plane'

describe Plane do

  it "will confirm takeoff" do
    expect(subject).to respond_to :taking_off
  end

  it "will confirm plane in air" do
    expect(subject).to respond_to :in_air
  end

end

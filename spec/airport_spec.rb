require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:takeoff) }
  it { is_expected.to respond_to(:land) }

  it "confirms that a plane takeoff" do
    plane = subject.takeoff
    expect(plane).to be_takeoff
  end

  it "confirms that a plane landed" do
    plane = subject.land
    expect(plane).to be_landed
  end


end

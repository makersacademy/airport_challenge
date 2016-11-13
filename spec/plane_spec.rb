require 'plane'

describe Plane do

  it "creates a new instance of a plane when a plane takes off" do
    expect(Plane.new).to respond_to :take_off
    #it { is_expected.to respond_to :take_off }
  end

end

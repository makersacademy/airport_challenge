require 'airport'

describe Airport do

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  it "instructs a plane to take off and confirms that it is no longer in the airport" do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq "#{plane} is no longer in the aiport"
  end
end

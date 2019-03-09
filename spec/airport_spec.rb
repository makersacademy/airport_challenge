require 'airport'

describe Airport do
  it { is_expected. to respond_to(:land) }

  describe "#land" do
    it "notifies that the plane has landed" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "#{plane} has landed"
    end
  end


end

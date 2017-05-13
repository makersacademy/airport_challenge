require 'airport'

describe Airport do

  describe '#plane_landed' do
    it "lets a plane land at an airport" do
      expect(subject).to respond_to :plane_landed
    end
    it "confirms that the plane has landed" do
      plane = subject.plane_landed
      expect(plane.landed?).to eq true
    end
  end
end

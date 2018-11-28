require "airport"

describe Airport do

  describe "#landing" do
    it 'It allows planes to land' do
      plane = Plane.new
      expect(subject.landingplane(plane)).to eq [plane]
    end
  end
end

require "airport"
require "plane"

RSpec.describe Airport do
  plane = Plane.new
  describe '#land' do
    it 'allows a plane to land' do
      expect(subject.land(plane)).to eq "Plane landed"
    end
  end
end
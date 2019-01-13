require 'airport'

RSpec.describe Airport do

  describe '#land' do
    it { should respond_to :land }
    plane = Plane.new
    it 'lands the plane' do
      subject.land(plane)
      expect(subject.landed_planes).to include(plane)
    end
  end

  describe '#takeoff' do
    it { should respond_to :takeoff }
    plane = Plane.new
    it 'instructs the plane to takeoff' do
      subject.land(plane)
      expect(subject.takeoff).to eq plane
    end
  end
end

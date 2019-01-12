require 'airport'
require 'plane'
RSpec.describe Airport do
  describe '#land' do
    it { should respond_to :land }
  end
  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
  describe '#takeoff' do
    it { should respond_to :takeoff }
  end
end

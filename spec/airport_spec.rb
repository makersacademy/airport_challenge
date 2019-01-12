require 'airport.rb'
require 'plane.rb'

describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  describe '#land' do
    it 'should land the plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq("The plane has landed.")
    end
  end

  describe '#takeoff' do
    it 'should let the plane takeoff' do
      plane = Plane.new
      expect(subject.takeoff(plane)).to eq("The plane has taken off.")
    end
  end
end

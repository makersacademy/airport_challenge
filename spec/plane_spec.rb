require_relative '../lib/plane.rb'

describe Plane do
  describe "#land" do
    it { is_expected.to respond_to :land }

    it 'should instruct a plane to land at an airport' do
    plane = Plane.new
    end
  end #land

  describe "#takeoff" do
    it { is_expected.to respond_to :takeoff }

    it 'should instruct plane to take off' do
    end
  end #takeoff

  describe "#flying?" do
    it { is_expected.to respond_to :flying? }

    it 'confirms plane has left the airport' do
      plane = Plane.new
      plane.takeoff
      expect(plane).to be_flying
    end

    it 'confirms plane has landed' do
      plane = Plane.new
      plane.land 
      expect(plane.flying?).to be false
    end
  end #flying

end

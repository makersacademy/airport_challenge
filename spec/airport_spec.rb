require './lib/airport'
require './lib/plane'

describe Airport do

  let(:plane) { Plane.new }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

    context "#land and #takeoff" do

      it "created a plane and adds it to landed planes" do

      subject.land(plane)
      expect(subject.landed_planes).to include plane
      end


      it 'removes plane from landed planes' do
      subject.takeoff(plane)
      expect(subject.landed_planes).to_not include plane
    end
      end
    end

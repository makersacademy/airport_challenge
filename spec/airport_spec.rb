require 'airport'

describe Airport do

  class FakePlane
    attr_accessor :landed

    def initialize
      @landed = false
    end

    def landed?
      @landed
    end
  end

  let(:plane) { FakePlane.new }

  describe '#land_plane' do
    it "should instruct a plane to land" do
      subject.land_plane(plane)
      expect(subject.planes[0]).to eq plane
    end
    it "should raise an error if plane has already landed" do
      subject.land_plane(plane)
      expect { subject.land_plane(plane) }.to raise_error "Sorry plane has already landed!" if subject.planes.include? plane
    end
  end

  describe '#take_off' do
    it "should instruct a plane to take off" do
      subject.land_plane(plane)
      expect(subject.take_off(plane)).to eq plane
    end
    it 'should raise an error if there are no planes' do
      expect { subject.take_off(plane) }.to raise_error "Sorry, no planes!" if subject.planes.empty?
    end
  end
end

require 'airport'

describe Airport do
  class Plane
  end
  let(:plane) { Plane.new }
  describe '#land_plane' do
    it "should instruct a plane to land" do
    subject.land_plane(:plane)
    expect(subject.planes[0]).to eq :plane
    end
  end

  describe '#take_off' do
    it "should instruct a plane to take off" do
      subject.land_plane(:plane)
      expect(subject.take_off(:plane)).to eq :plane
    end
    it 'should raise and error if there are no planes' do
      expect {subject.take_off(:plane)}.to raise_error "Sorry, no planes!" if subject.planes.empty?
    end
  end
end

require 'plane'
test_plane = Plane.new

describe Plane do

  it 'is made in a factory' do
    expect(test_plane.location).to eq "Factory"
  end

  describe '#fly' do
    it "flies in the sky" do
      test_plane.fly
      expect(test_plane.location).to eq "Sky"
    end
  end
end

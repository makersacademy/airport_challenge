require 'plane'

describe Plane do

  let(:test_airport) { double(:airport) }
  let(:test_plane) { Plane.new }
  it 'is made in a factory' do
    expect(test_plane.location).to eq "Factory"
  end

  describe '#fly' do
    it "flies in the sky" do
      test_plane.fly
      expect(test_plane.location).to eq "Sky"
    end
  end

  describe '#arrive' do
    it "arrives at an airport" do
      test_plane.arrive(test_airport)
      expect(test_plane.location).to eq test_airport
    end
  end

end

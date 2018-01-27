require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  it "is empty when created" do
    expect(subject.planes).to eq []
  end

  describe '#land' do

    before(:each) { subject.land(plane) }

    it "stores the plane in the airport" do
      expect(subject.planes).to include plane
    end

    it "raises an error if plane has already landed" do
      expect { subject.land(plane) }.to raise_error "Plane has already landed"
    end

  end

  describe '#take_off' do

    it "releases a plane from the airport" do
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it "no longer stores plane in the airport" do
      subject.land(plane)
      subject.take_off
      expect(subject.planes).not_to include plane
    end

    it "raises an error if airport is empty" do
      expect { subject.take_off }.to raise_error "No planes available"
    end

  end

end

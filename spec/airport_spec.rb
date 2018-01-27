require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it "is empty when created" do
    expect(subject.planes).to eq []
  end

  describe '#land' do

    it "stores the plane in the airport" do
      subject.land(plane)
      expect(subject.planes).to include plane
      subject.planes
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

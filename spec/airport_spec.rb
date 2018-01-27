require 'airport'

describe Airport do

  it "is empty when created" do
    expect(subject.planes).to eq []
  end

  describe '#land' do

    let(:plane) { Plane.new }

    it "stores the plane in the airport" do
      subject.land(plane)
      expect(subject.planes).to include plane
    end

  end

end

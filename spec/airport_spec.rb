require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  it "is empty when created" do
    expect(subject.planes).to eq []
  end

  describe '#land' do

    let(:plane) { double :plane }

    it "stores the plane in the airport" do
      subject.land(plane)
      expect(subject.planes).to include plane
      subject.planes
    end

  end

end

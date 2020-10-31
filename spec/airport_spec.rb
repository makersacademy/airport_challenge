require 'airport'

describe Airport do
  it "Allows the user to create an instance of Airport" do
    expect(subject).to be_an_instance_of(Airport)
  end
  describe '#land' do
    it "Instances of airport respond to the land method" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it "Airport should store the landed plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
  end
end

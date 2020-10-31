require 'airport'

describe Airport do
  it "Allows the user to create an instance of Airport" do
    expect(subject).to be_an_instance_of(Airport)
  end
  describe '#land' do
    it "Instances of airport respond to the land method, accepting plane as argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it "airport should store the landed plane" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq(plane)
    end
  end
end

require 'plane'

describe Plane do
  it "Allows the user to create an instance of Plane" do
    expect(subject).to be_an_instance_of(Plane)
  end
  describe '#land' do
    it "Instances of plane respond to the land method" do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end
end

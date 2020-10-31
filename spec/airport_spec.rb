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
      expect(subject.plane).to eq([plane])
    end
  end
  describe '#takeoff' do
    it 'Instances of airport respond to the takeoff method' do
      expect(subject).to respond_to(:takeoff).with(1).argument
    end
    it "airport should release the stored plane" do
      plane = Plane.new
      subject.takeoff(plane)
      expect(subject.plane).not_to eq(plane)
    end
  end
  describe "When airport is at capacity" do
    it "Does not allow planes to land" do
      20.times {subject.land Plane.new}
      expect { subject.land Plane.new }.to raise_error "Airport full! You cannot land here!"
    end
  end
end

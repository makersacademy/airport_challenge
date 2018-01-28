require 'airport'

describe Airport do

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "allow planes to land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
    it "raises an error when airport is full" do
      plane = Plane.new
      subject.capacity.times{ subject.land plane}
      expect { subject.land plane }.to raise_error "You can't land, Airport is full"
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it "allow to planes to take off" do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq [plane]
    end
  end

  describe "hangar" do
    it "returns landed planes" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).to eq [plane]
    end
  end


  describe "initialization" do
    it "should have a deafult capacity to keep the landed planes " do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY

    end
  end
end

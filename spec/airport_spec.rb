require 'airport'

describe Airport do

  before (:each) do
    @plane = Plane.new

end
  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "allow planes to land" do
      expect(subject.land(@plane)).to eq [@plane]
    end
    
    it "raises an error when airport is full" do
      Airport::DEFAULT_CAPACITY.times{ subject.land @plane}
      expect { subject.land @plane }.to raise_error "Airplane is not allow to land, Airport is full"
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it "allow to planes to take off" do
      expect(subject.take_off(@plane)).to eq "Plane has taken off"
    end
  end

  describe "hangar" do
    it "returns landed planes" do
      subject.land(@plane)
      expect(subject.hangar).to eq [@plane]
    end
  end


  describe "initialization" do
    it "should have a deafult capacity to keep the landed planes " do
     Airport::DEFAULT_CAPACITY.times do
       subject.land(@plane)
     end
    end
  end
end

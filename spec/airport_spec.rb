require 'airport'
require 'weather'

describe Airport do

  before (:each) do
    @plane = Plane.new

end
  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "allow planes to land" do
      expect(subject.land(@plane)).to eq "Plane has landed"
    end

    it "raises an error when airport is full" do
      Airport::DEFAULT_CAPACITY.times{ subject.land @plane}
      expect { subject.land @plane }.to raise_error "Airplane is not allow to land, Airport is full"
    end

    it "doesn't allow a plane to land if storm weather" do
      subject.take_off(@plane)
      allow(subject).to receive(:storm?).and_return(true)
      expect {subject.land(@plane)}.to raise_error " Airplane is not allowed to land due to stormy weather"
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it "allow to planes to take off" do
      expect(subject.take_off(@plane)).to eq "Plane has taken off"
    end

    it "doesn't allow plane to take off due to storm" do
      subject.land(@plane)
      allow(subject).to receive(:storm?).and_return(true)
      expect {subject.take_off(@plane)}.to raise_error "Airplane is not allowed to take off due to stormy weather"
    end

   #  it "plane is not longer available, has already taken off" do
   #   subject.land(@plane)
   #   subject.take_off(@plane)
   #   expect(subject.hangar).to_not include(@plane)
   # end

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

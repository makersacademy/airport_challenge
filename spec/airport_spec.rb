require "airport"

describe Airport do

  subject(:airport){ described_class.new }

  context "status of the airportcle" do

    it {is_expected.to respond_to :planes}

    it "when initialize has no planes(planes is an empty array)" do
      expect(subject.planes).to eq []
    end

  end

  context "instruct plan to #land" do

    it {is_expected.to respond_to :land}

    it "- give a confirmation that particular plane landed" do
      plane = Plane.new
      expect(subject.land plane).to eq "#{plane} has landed"
    end

    it "- keeps info about landed planes" do
      plane = Plane.new
      subject.land plane
      expect(subject.planes).to eq [plane]
    end

  end

  context "instruct plan to #takeoff" do

    it {is_expected.to respond_to :takeoff}

    it "- give a confirmation that particular plane took off" do
      plane = Plane.new
      expect(subject.takeoff plane).to eq "#{plane} has taken off"
    end

    it "- update it's info about plane if it took off" do
      plane = Plane.new
      plane1 = Plane.new
      subject.land plane
      subject.land plane1
      subject.takeoff plane
      expect(subject.planes).to eq [plane1]
    end

  end

end
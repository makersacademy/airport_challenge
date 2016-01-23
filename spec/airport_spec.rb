require "airport"

describe Airport do

  subject(:airport){ described_class.new }

  context "instruct plan to #land" do

    it {is_expected.to respond_to :land}

    it "give a confirmation when plan landed" do
      expect(subject.land Plane.new).to eq "Plane has landed"
    end

  end

  context "instruct plan to #takeoff" do

    it {is_expected.to respond_to :takeoff}

    it "give a confirmation when plan took off" do
      expect(subject.takeoff Plane.new).to eq "Plane has taken off"
    end
  end

end
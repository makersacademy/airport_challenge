require "airport"

describe Airport do

  subject(:airport){ described_class.new }

  context "accept plan to #land" do

    it {is_expected.to respond_to :land}

    it "give a confirmation when plan landed" do
      expect(subject.land Plane.new).to eq "Plane has landed"
    end

  end

end
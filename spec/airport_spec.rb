require 'airport'

describe Airport do
  describe "#list_planes" do
    it "can report when there are no planes in the airport" do
      expect(subject.list_planes).to eq "There are no planes in the airport."
    end
  end
end

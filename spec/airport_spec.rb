require 'airport'

describe Airport do

  describe "#land_plan" do
    it 'Allows a plan to land' do
      expect(subject).to respond_to :land_plan
    end
  end
end

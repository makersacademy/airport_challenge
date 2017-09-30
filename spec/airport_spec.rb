require 'airport'

describe Airport do
  #   it "allows a plane to land " do
  #     expect(subject).to respond_to(:land)
  #   end
  # end
  describe "landing plane tests" do
    it { is_expected.to respond_to :land}
  end
end

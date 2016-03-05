require 'weather'

  describe Weather do
    describe "#storm" do
    it {is_expected.to respond_to(:storm)}
  end

end

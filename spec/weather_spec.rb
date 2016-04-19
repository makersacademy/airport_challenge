require 'weather'
  describe 'weather' do
    describe "#storm" do
    it 'responds to weather' do
      expect(subject).to respond_to(:weather)
    end
  end
end


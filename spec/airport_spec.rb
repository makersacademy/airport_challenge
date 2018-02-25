require 'airport'
describe Airport do

  describe "#plane" do
    it 'respond to plane method' do
      expect(Airport.new).to respond_to :planes
    end
  end

end

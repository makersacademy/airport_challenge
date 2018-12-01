require 'airport'

describe '#airport' do
  let(:airport) { Airport.new }

  describe "#land" do
    it "interacts with #land method and take 1 argument" do
      expect(airport).to respond_to(:land).with(1).argument
    end
    it "#" do

    end
  end
end

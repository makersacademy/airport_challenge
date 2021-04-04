require 'airport'
require 'plane'

describe 'Airport' do
  describe 'conditions for #land(plane)' do
    it "allows airport to accept landing plane" do
      allow(subject).to receive(:land)
    end
  end
end
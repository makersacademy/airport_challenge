require 'plane'

describe Plane do

  describe '#take_off' do
    it "expects plane to respond to take off" do
      expect(subject).to respond_to :take_off
    end
  end
end

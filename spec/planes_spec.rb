require 'planes'

describe Planes do

  describe "#take_off" do
    it 'responds when called' do
      plane = Planes.new
      expect(plane).to respond_to :take_off
    end
  end
end

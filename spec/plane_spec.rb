require 'plane'

RSpec.describe Plane do 
  describe '#working?' do
    it ' confirms Plane can respond to working? methods' do
      expect(Plane.new).to respond_to :working?
    end
  end
end

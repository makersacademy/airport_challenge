require 'plane'
require 'airport'

RSpec.describe Plane do 
  describe '#working?' do
    it ' confirms Plane can rspond to working? methods' do
      expect(Plane.new).to respond_to :working?
    end
  end
end

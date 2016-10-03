require './lib/plane.rb'

describe Plane do
  describe 'it should check if plane is in working order' do
    it { is_expected.to respond_to :working?}
  end


end

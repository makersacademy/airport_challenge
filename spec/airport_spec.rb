require 'airport'

describe Airport do
  subject(:airport) { Airport.new }

  describe 'landing planes' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe 'planes taking off' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
  end

end

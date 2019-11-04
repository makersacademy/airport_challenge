require 'airport'

describe Airport do
  it { is_expected.to be_an_instance_of(Airport) }

  describe 'instruct a plane to land at an airport' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

end

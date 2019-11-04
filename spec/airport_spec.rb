require 'airport'

describe Airport do
  it { is_expected.to be_an_instance_of(Airport) }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

end

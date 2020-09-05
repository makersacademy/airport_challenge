require 'airport'

describe Airport do
  describe '#land' do
    it 'responds to request to land with 1 parameter' do
      expect { subject.to respond_to(:land).with(1).argument }
    end

  end
end
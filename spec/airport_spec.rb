require 'airport'

describe Airport do

  describe 'land' do
    it 'responds to land' do
      expect { is_expected.to respond_to :land }
    end
  end
end

require 'airport'

describe Airport do
  describe 'confirm_landing' do
    it {is_expected.to respond_to(:confirm_landing)}
  end
end

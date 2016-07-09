require 'airport'

describe AirPort do

  context '#confirm_landed' do
    it { is_expected.to respond_to :confirm_landed }
  end

end

require 'airport.rb'

describe Airport do

  describe 'take_off' do
  it {is_expected.to respond_to :take_off}
  end

  describe 'land' do
  it {is_expected.to respond_to :land}
  end

end

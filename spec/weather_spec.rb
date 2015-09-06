require 'weather'

describe Weather do

  xit 'randomly initializes as sunny or stormy' do
    is_expected.to be_sunny || be_stormy
  end

end
require 'weather'

describe Weather do

  it 'is either sunny or stormy' do
    is_expected.to (be_sunny || be_stormy)
  end

end
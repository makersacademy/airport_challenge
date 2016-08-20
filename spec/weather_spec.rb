require 'weather'

describe Weather do

  it {is_expected.to respond_to(:stormy)}
  it {is_expected.to respond_to(:storm_level)}

  it 'is stormy when storm level is greater than 7/10'

end

require 'airport'

describe Airport do

  it {is_expected.to respond_to(:take_off).with(1).argument}
  it {is_expected.to respond_to(:landing).with(1).argument}
  it {is_expected.to respond_to :weather}

end

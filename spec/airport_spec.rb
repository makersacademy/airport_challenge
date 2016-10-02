require 'airport'

describe Airport do

  it {is_expected.to respond_to (:land).with(1).arguement}
  it {is_expected.to respond_to (:take_off).with(1).arguement}




end

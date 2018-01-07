require 'airport'

describe Airport do
  it{is_expected_to respond_to(:land).with(1).argument}
end

require  "airport"

describe Airport do
  it {is_expected.to be_a(Object)}
  it {is_expected.to respond_to(:land)}
  it {is_expected.to respond_to(:land).with(1).argument}

end

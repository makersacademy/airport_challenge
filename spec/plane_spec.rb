require "plane"

describe Plane do

  it {is_expected.to respond_to (:land)}
  it {is_expected.to respond_to (:confirm_landing)}

end

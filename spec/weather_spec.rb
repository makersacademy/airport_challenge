require 'weather'

describe Weather do
  let(:dummy_class) {Class.new {include Weather}}
  subject(:class) {dummy_class.new}

  it{is_expected.to respond_to(:stormy?)}

end

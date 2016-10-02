require 'weather'

describe Weather do

  describe "is an instance of the Weather class"
  it {expect(subject.is_a?(Weather)).to eq true}

end

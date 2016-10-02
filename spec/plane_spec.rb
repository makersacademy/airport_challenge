require 'plane'

describe Plane do

  describe "It shoild be an isntance of the Plane class"
  it {expect(subject.is_a?(Plane)).to eq true}

  describe "has an attribute 'landed'"
  it {is_expected.to respond_to(:landed)}

  describe "'landed' attribute should be false"
  it {expect(subject.landed).to eq false}

  describe "can have 'landed' attribute changed"
  it {expect(subject.landed=true).to eq true}

end

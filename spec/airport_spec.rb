require 'airport'

describe Airport do

  describe "is an instance of the Airport class"
  it {expect(subject.is_a?(Airport)).to eq true}

  describe "has a default capacity of 5"
  it {expect(subject.capacity).to eq(5)}

  describe "can check if there is a storm"
  it {is_expected.to respond_to(:conditions_good?)}

end

require 'airport'

describe Weather do

  describe "#stormy?" do
    it {expect(subject).to respond_to(:stormy?)}
    it {expect(subject.stormy?).to be(true).or be(false)}
  end

end

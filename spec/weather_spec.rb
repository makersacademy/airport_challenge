require 'airport'

describe Weather do

  describe "#stormy?" do
    it {expect(subject).to respond_to(:stormy?)}
  end

end

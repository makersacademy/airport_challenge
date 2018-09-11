require 'weather'

describe Weather do

  it "Weather#storms?" do
      expect(subject).to respond_to(:storms?)
  end

end

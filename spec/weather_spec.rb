require "weather"

describe Weather do

  it "Will raise an error if the weather is stormy." do
    conditions = "Stormy"
    allow(subject).to receive(:conditions).and_raise "To stormy cannot take off/land."
  end
end

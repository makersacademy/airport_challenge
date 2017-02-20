require 'weather'

describe Weather do
subject(:weather) {described_class.new}

  it "reports if stormy" do
    allow(subject).to receive(:conditions) {"stormy"}
  end

end

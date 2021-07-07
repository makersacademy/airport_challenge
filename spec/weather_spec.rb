require 'weather'

RSpec.describe Weather do
subject(:weather) { Weather.new }

  it "creates rainy weather" do
    allow(Kernel).to receive(:rand).and_return(0)
    expect(subject.generate).to eq(0)
  end

  it "creates sunny weather" do
    allow(Kernel).to receive(:rand).and_return(1)
    expect(subject.generate).to eq(1)
  end

  it "creates stormy weather" do
    allow(Kernel).to receive(:rand).and_return(2)
    expect(subject.generate).to eq(2)
  end

end
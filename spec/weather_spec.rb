require 'weather'
describe Weather do
  it "test's if it reacts to stormy" do
    expect(subject).to respond_to(:stormy)
  end
  it "test stormy = true" do
    allow(subject).to receive(:rand).and_return(6)
    expect(subject.stormy).to eq true
  end
  it "test stormy = true" do
    allow(subject).to receive(:rand).and_return(0)
    expect(subject.stormy).to eq false
  end
end

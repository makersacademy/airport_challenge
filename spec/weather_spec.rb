require 'weather'
describe Weather do
  it {is_expected.to respond_to(:stormy?)}
  it "when stormy is called it returns a boolean" do
    expect(subject.stormy?).to be(true).or be(false)
  end
end

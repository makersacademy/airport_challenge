require 'weather'

describe Weather do
  let(:pseudo_class) { Class.new { include Weather } }
  let(:pseudo_object) { pseudo_class.new }
  it "returns true or false" do
    expect(pseudo_object.stormy?).to eq(true).or eq(false)
  end
end

require "weather"

# further validation required
describe Weather do
  let(:px) {Class.new{extend Weather}}
  
  it "returns a random output" do
    out = px.stormy?
  end
end
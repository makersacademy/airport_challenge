require_relative "../lib/airport.rb"
describe Airport do
  it "responded to  test_method" do
    expect(subject).to respond_to(:test_method)
  end
end

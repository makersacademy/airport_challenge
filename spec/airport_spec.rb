require './lib/airport'

describe Airport do
  it "verifies Airport exists" do
    expect(Airport.new).to be_a(Object)
  end
end
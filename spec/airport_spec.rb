require 'airport.rb'

describe Airport do

  it "responds to the full? method" do
    expect(subject).to respond_to(:full)
  end

end

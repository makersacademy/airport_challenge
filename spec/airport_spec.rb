require 'airport.rb'

describe Airport do
  it "can make a new instance of Airport class" do
    expect(Airport.new).not_to raise_error
  end
end
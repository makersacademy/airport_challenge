require 'airport.rb'

describe Airport do
  it "can make a new instance of Airport class" do
    expect(Airport.new).to be_an_instance_of Airport
  end
end
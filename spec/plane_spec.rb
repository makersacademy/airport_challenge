#require 'coveralls'
#Coveralls.wear!
require 'plane'

describe Plane do
  it "lands when instructed to land" do
    expect(subject).to respond_to(:land)
  end

  it "confirms that it has landed" do

  end
end

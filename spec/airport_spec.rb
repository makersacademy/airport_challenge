require 'airport'

RSpec.describe Airport do
  subject(:airport) { described_class.new }

  it "makes a plane land at an airport" do
    expect(airport).to respond_to(:land).with(1).argument
  end

end

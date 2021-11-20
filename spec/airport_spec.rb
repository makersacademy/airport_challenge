require 'airport'

describe Airport do
  let(:gatwick) { described_class.new }
  
  it "instruct a plane to land" do
    expect(gatwick).to respond_to(:land).with(1).argument
  end
end
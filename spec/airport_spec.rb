require 'airport'
describe Airport do
  it "lands one plane at the airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end
end

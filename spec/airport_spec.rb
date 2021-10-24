require "airport"
describe Airport do
  it 'instructing a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it "letting us know plain has left airport" do
    expect(subject).to respond_to(:take_off)
  end
end
require 'airport'
require 'plane'
describe Airport do 
  it "checks land method" do 
    expect(subject).to respond_to(:land).with(1).argument
  end
end


require 'security'
describe Security do

  before(:example) do
    @security = Security.new("Scott",50000)
  end

  describe 'passport checks' do

    it 'method check' do
    expect(@security).to respond_to :securityfailed
    expect(@security).to respond_to :securitypassed
  end
end

  it 'accepts two arguments and creates instance variables' do
    expect(@security.name).to start_with("S") & end_with("t")
  end
end
  # it 'can authenticate passport' do
  # expect

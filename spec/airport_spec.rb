require 'airport.rb'

describe Airport do
  
  it 'should respond to land' do
    expect(subject).to respond_to(:land)
  end

end
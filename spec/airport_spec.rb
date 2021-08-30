require 'airport'

describe Airport do 
  subject (:airport) { described_class.new }

  it 'tells airplane to land' do
    expect(airport).to respond_to(:land).with(1).argument 
  end

  it 'tells airplane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
end  

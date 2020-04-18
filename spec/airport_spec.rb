require 'airport'

describe Airport do
  
  #test 1, it should respond to a method 'land'
  it "it should respond to the method with 1 arguement" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  #test 2, it should respond to method 'take_off'
  it "should respond to the method with 1 arguement" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

end
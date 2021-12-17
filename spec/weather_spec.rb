require 'weather'

describe Weather do

  it { should respond_to(:stormy?)}

  it "returns either true or false when asked if weather is stormy" do
    expect(subject.stormy?).to satisfy { |result| result == true || result == false } 
  end

end

require 'weather'

describe Weather do

  it "provides an answer to .stormy?" do
    expect(self.stormy).to be_instance_of Boolean
  end
    
end

require 'airport'

describe Airport do
  it { should respond_to(:land).with(1).argument }
end

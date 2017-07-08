require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  it { should respond_to(:land).with(1).argument }

end

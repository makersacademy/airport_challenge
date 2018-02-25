require './lib/airport'

describe Airport do

  it { should respond_to(:landing, :full?, :take_off,) }
end

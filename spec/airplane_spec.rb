require 'airplane'
require 'airport'
require 'weather'

describe Airplane do
  it "doesn't raise error when creating airplane" do
    expect { Airplane.new }.not_to raise_error
  end

end

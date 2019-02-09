require 'airport'

describe Airport do

  it 'is actually a real Airport' do
    expect { Airport.new }.to_not raise_error
  end




end

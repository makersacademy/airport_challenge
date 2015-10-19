require 'weather'

describe Weather do

  it 'responds to #stormy? with true or false' do
    expect([true,false]).to include Weather.stormy?
  end

end

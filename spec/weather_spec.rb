require 'weather'

describe Weather do

  it 'checks #stormy? and responds with true or false' do
    expect([true, false]).to include(subject.stormy?)
  end

end

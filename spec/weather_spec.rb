require 'weather'

describe Weather do

  it 'should be stormy' do
    expect { weather(stormy) }
  end

  it 'should be sunny' do
    expect { weather(sunny) }
  end
end

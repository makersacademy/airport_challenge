require 'weather'

describe Weather do
  it 'can be stormy' do
    expect(subject).to respond_to(:storm)
  end

end

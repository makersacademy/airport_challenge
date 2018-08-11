require 'weather'

describe Weather do

  it 'can set the #stormy to true' do
    expect(subject.stormy).to eq(true)
  end

end

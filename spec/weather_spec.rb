require 'weather'

describe Weather do

  it 'checks whether #stormy?' do
    expect(subject).to respond_to :stormy?
  end

  it 'checks whether #stormy? and responds with true or false' do
    expect([true, false]).to include(subject.stormy?)
  end

end

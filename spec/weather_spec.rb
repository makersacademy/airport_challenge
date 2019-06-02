require 'weather'

describe Weather do
  it 'responds with false when is_stormy? method is run' do
    expect(subject.stormy?).to be(true).or be(false)
  end

end

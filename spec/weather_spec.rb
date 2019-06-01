require 'weather'

describe Weather do
  it 'responds with false when is_stormy? method is run' do
    expect(subject.is_stormy?).to eql(false)
  end
end
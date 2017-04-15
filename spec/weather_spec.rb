require 'weather'

describe Weather do
  it {is_expected.to respond_to :stormy?}

  it 'can be stormy' do
    subject.stormy
    expect(subject).to be_stormy
  end
end

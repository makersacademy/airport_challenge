describe Weather do
  it { is_expected.to respond_to(:stormy?) }

  it 'should be random' do
    arr = []
    50.times { arr << subject.stormy? }
    expect(arr).to include true && false
  end
end

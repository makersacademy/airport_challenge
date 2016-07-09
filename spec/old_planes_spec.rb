
=begin
describe Airplane do
  #it {is_expected.to respond_to :landed?}
  it 'has landed at the airport' do
  subject.land
  expect(subject.landed?).to be true
  end

  #it {is_expected.to respond_to :taken_off?}
  it 'has taken off' do
    expect(subject.taken_off?).to eq true
end
end
=end

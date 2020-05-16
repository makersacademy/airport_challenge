require 'weather'

describe Weather do

  subject { Weather.new }

  it 'when random_number is 4 weather returns sunny' do
    allow(subject).to receive(:random_number) { 4 }
    expect(subject.forecast).to eq('sunny')
  end

end

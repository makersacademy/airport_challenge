require 'weather'

describe Weather do

  it 'responds to status' do
    expect(subject).to respond_to :status
  end

  it 'varies' do
    allow(subject).to receive(:status).and_return('sunny', 'stormy', 'sunny')
    expect(subject.status).to eq 'sunny'
    expect(subject.status).to eq 'stormy'
    expect(subject.status).to eq 'sunny'
  end


end

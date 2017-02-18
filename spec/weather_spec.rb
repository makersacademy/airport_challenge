require 'weather'

describe 'weather' do

  it 'is stormy' do
    expect(subject.status).to eq "Stormy"
  end

end

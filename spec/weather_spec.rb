require 'weather'

describe 'weather'

  it 'is stormy?' do
    expect(subject.status).to eq "Stormy"
  end

end

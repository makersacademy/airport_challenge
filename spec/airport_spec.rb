require './lib/airport'

describe Airport do

  it 'has weather' do
    expect(subject).to respond_to(:weather)
  end

end

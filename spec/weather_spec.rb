require 'weather'

describe Weather do

  it 'can sometimes be stormy' do
    allow_any_instance_of(Random).to receive(:rand).and_return(1)
    expect(subject.forecast).to eq :stormy
  end

  it 'can sometimes be fine' do
    allow_any_instance_of(Random).to receive(:rand).and_return(7)
    expect(subject.forecast).to eq :fine
  end

end

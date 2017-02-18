require 'airport'


describe Airport do

  it 'responds to land plane' do
    expect(subject).to respond_to :land
  end

  it { is_expected.to respond_to :land}

  it 'responds to land plane' do
    expect(subject).to respond_to :take_off
  end

  it { is_expected.to respond_to :take_off}

end

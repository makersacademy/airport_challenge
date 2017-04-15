require 'weather'
describe Weather do

  it 'expects weather to be sunny' do
    expect(subject.status == 'sunny').to eq true
  end

end

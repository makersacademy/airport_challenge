describe Weather do
it 'responds to stomry?' do
expect(subject).to respond_to :stormy?
end

it 'it returns an interger' do
  expect(subject.weather).to be_a(Integer)
end

end

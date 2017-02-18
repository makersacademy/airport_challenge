describe 'weather'
  it 'is stormy?' do
    expect(subject).to respond_to(:stormy?)
  end
end

class DayOne

end


describe DayOne do
  it 'prints Hello World'
  it 'finds the index of the word "Ruby"'
  it 'Prints name 10 times'
  it 'Prints sentences 1..10'
  context 'Bonus' do
    it 'picks a random number'
    context 'Guess number' do
      it 'tells you if the guess is too high'
      it 'tells you if the guess is too low'
    end
  end
end
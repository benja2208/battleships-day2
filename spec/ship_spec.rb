require 'ship'

describe Ship do
  xit 'initializes with a position' do
    subject = described_class.new('A4')
    expect(subject.pos).to eq 'A4'
  end

  it 'will not place a ship beyond the board' do
    subject = Ship.new
    expect { subject.position ('Z4') }.to raise_error('Outside the board')
  end
end

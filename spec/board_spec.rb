require 'board'

describe Board do
  it { is_expected.to respond_to(:place) }

  it { is_expected.to respond_to(:fire).with(1).argument }

  it 'places a ship' do
    subject.place
    expect(subject).not_to be_empty
  end

  it 'says hit for a hit' do
    ship = double :ship, pos: 'A1'
    expect(subject.fire('A1')).to eq 'Hit'
  end
end

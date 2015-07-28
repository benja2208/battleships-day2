require 'board'

describe Board do
  let(:ship){double :ship}

  it ' it initiatiates with default 10x10 grid' do 
    expect(subject.b.count).to eq 10
  end 

  it 'can have any size' do 
    board = Board.new 4
    expect(board.b.count).to eq 4
  end 

  describe '#placing ' do 
    it { is_expected.to respond_to(:place).with(4).argument }

    it 'places a ship in its position' do
      subject.place(ship,0,0,'S')
      expect(subject.b[0][0]).to eq 'X'
    end

    it 'will not place a ship beyond the board' do
      expect{subject.place ship,subject.size,subject.size,'S'}.to raise_error('Outside the board')
    end

    it 'should increase the count of ships' do 
      subject.place(ship,1,1,'S')
      expect(subject.n_of_X).to eq 2
    end 

    it 'cannot place a ship on another one' do 
      subject.place(ship,1,1,'S')
      expect{subject.place(ship,1,1,'S')}.to raise_error 'Those coordinates are already used!'
    end 
  end 

  describe '#fire' do 
    it { is_expected.to respond_to(:fire).with(2).argument }

    it "says 'H' for a hit" do
      subject.place(ship,1,1,'S')
      expect(subject.fire(1,1)).to eq 'H'
    end

    it "says 'M' for a miss" do
      subject.place(ship,1,1,'S')
      expect(subject.fire(2,2)).to eq 'M'
    end
  end 
  
  describe '#number_of_hits' do 
    it 'shows the number of hits' do 
      subject.place(ship,3,3,'S')
      subject.place(ship,1,1,'S')
      subject.fire(1,1)
      subject.fire(3,3)
      expect(subject.number_of_hits).to eq 2
    end 
  end 

  describe '#number_of_missed' do 
    it 'shows the number of misses' do 
      subject.place(ship,3,3,'S')
      subject.place(ship,1,1,'S')
      subject.fire(1,4)
      subject.fire(3,6)
      expect(subject.number_of_misses).to eq 2
    end 
  end 


  describe '#victory' do 
    it 'will return true when all ships are hit' do 
      subject.place(ship,3,3,'S')
      subject.fire(3,4)
      subject.fire(3,3)
      expect(subject.victory?).to eq true
    end 
  end 

  describe '#log' do 
    it 'will show the numbers of misses and hits' do 
      subject.place(ship,3,3,'S')
      subject.place(ship,1,1,'S')
      subject.fire(1,1)
      subject.fire(3,2)
      expect(subject.log).to eq 'H:1, M:1'
    end 
  end 
end

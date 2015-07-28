require 'board'

describe Board do
  before{allow(subject).to receive(:see_board)}
  let(:ship){double :ship, size: 2}

  it ' it initiatiates with default 10x10 grid' do 
    expect(subject.grid.count).to eq 10
  end 

  it 'can have any size' do 
    board = Board.new 4
    expect(board.grid.count).to eq 4
  end 

  describe '#placing ' do 
    # it { is_expected.to respond_to(:place).with(4).argument }

    it 'places a ship in its position' do
      subject.place(ship,:a1, :vertically)
      expect(subject.grid[0][0]).to eq 'X'
    end

    it 'will not place a ship beyond the board' do
      expect{subject.place(ship,:j11,:vertically)}.to raise_error('Outside the board')
    end

    it 'should increase the count of ships' do 
      subject.place(ship,:b2, :vertically)
      expect(subject.number_of_lives).to eq 2
    end 

  #   it 'cannot place a ship on another one' do 
  #     subject.place(ship,1,1,:vertically)
  #     expect{subject.place(ship,1,1,:vertically}.to raise_error 'Those coordinates are already used!'
  #   end 
  # end 

  # describe '#fire' do 
  #   it { is_expected.to respond_to(:fire).with(2).argument }

  #   it "says 'H' for a hit" do
  #     subject.place(ship,1,1,:verticall)
  #     expect(subject.fire(1,1)).to eq 'H'
  #   end

  #   it "says 'M' for a miss" do
  #     subject.place(ship,1,1,:vertically)
  #     expect(subject.fire(2,2)).to eq 'M'
  #   end
  # end 
  
  # describe '#number_of_hits' do 
  #   it 'shows the number of hits' do 
  #     subject.place(ship,3,3,:vertically)
  #     subject.place(ship,1,1,:vertically)
  #     subject.fire(1,1)
  #     subject.fire(3,3)
  #     expect(subject.number_of_hits).to eq 2
  #   end 
  # end 

  # describe '#number_of_missed' do 
  #   it 'shows the number of misses' do 
  #     subject.place(ship,3,3,:vertically)
  #     subject.place(ship,1,1,:vertically)
  #     subject.fire(1,4)
  #     subject.fire(3,6)
  #     expect(subject.number_of_misses).to eq 2
  #   end 
  # end 


  # describe '#victory' do 
  #   it 'will return true when all ships are hit' do 
  #     subject.place(ship,3,3,:vertically)
  #     subject.fire(3,4)
  #     subject.fire(3,3)
  #     expect(subject.victory?).to eq true
  #   end 
  # end 

  # describe '#log' do 
  #   it 'will show the numbers of misses and hits' do 
  #     subject.place(ship,3,3,:vertically)
  #     subject.place(ship,1,1,:vertically)
  #     subject.fire(1,1)
  #     subject.fire(3,2)
  #     expect(subject.log).to eq 'H:1, M:1'
  #   end 

    it "can figure out all coords horizonally" do
      expect(subject.all_coords(:a2,4, :horizontally)).to eq [[0,1],[0,2],[0,3],[0,4]]
    end

    it "can figure out all coords:verticallyl" do
      expect(subject.all_coords(:a2,4, :vertically)).to eq [[0,1],[1,1],[2,1],[3,1]]
    end

    it "can work out the next vertical coord" do
      expect(subject.next_vertical_coord(:a1)).to eq :b1
    end

    it "can convert a2 to 0,1" do
      expect(subject.convert_to_array(:a2)).to eq [0,1]
    end
  end 
end

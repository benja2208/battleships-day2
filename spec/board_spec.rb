require 'board'

describe Board do
  it { is_expected.to respond_to(:place).with(1).argument }


end

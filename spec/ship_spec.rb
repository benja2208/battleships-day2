require 'ship'

describe Ship do
  it { is_expected.to respond_to :create }

  it 'creates a ship' do
    subject.create
    expect(subject).not_to be_empty
  end
end

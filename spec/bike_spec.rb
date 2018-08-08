require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to :condition }

  it 'Should, by default, be working' do
    bike = Bike.new
    expect(bike.condition).to eq true
  end
end
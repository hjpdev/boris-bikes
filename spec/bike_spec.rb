require 'bike'

describe Bike do

  it { is_expected.to respond_to :condition }

  it 'should, by default, be working' do
    expect(subject.condition).to eq true
  end
end
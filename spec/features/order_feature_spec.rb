require 'spec_helper'

describe 'Order' do 

  before(:each) do
    Order.create(number_of_items: 1)
  end

  it 'emails a confirmation when an order is placed' do
    expect { Order.create(number_of_items: 1)}.to change { emails.count }.by 1
  end

  it 'should have the subject Order confirmation' do
    expect(emails.last.subject).to eq 'Order confirmation'
  end

  it 'should include the number of items ordered' do
    expect(emails.last.body).to match /1 item/
  end

  
end
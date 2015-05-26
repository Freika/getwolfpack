require 'rails_helper'

describe Account, type: :model do
  let(:account) { build(:account) }

  it 'validates subdomain format' do
    account.subdomain = ''
    expect(account).to be_invalid

    account.subdomain = 'ab'
    expect(account).to be_invalid


    account.subdomain = 'ab'
    expect(account).to be_invalid


    account.subdomain = 'ab-'
    expect(account).to be_invalid


    account.subdomain = '-ab'
    expect(account).to be_invalid

    account.subdomain = '1abc'
    expect(account).to be_invalid

    account.subdomain = 'abc1'
    expect(account).to be_valid

    account.subdomain = 'abc'
    expect(account).to be_valid

    account.subdomain = 'a-b1c'
    expect(account).to be_valid
  end

  it 'checks for subdomain uniqueness' do
    account.save!
    a = build(:account)
    expect(account).to be_valid

    a.subdomain = account.subdomain
    expect(account).to be_valid
  end
end

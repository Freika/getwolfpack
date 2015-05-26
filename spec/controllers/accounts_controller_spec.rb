require 'rails_helper'

describe AccountsController, type: :controller do
  it 'shows new account form' do
    get :new

    expect(response.status).to eq 200
    expect(response).to render_template :new

    expect(assigns(:account)).to be_a_new Account
    expect(assigns(:account).owner).to be_a_new User
  end

  let(:account_attributes) do
    FactoryGirl.attributes_for(:account).merge(owner_attributes: FactoryGirl.attributes_for(:user))
  end

  it 'creates new account' do
    expect do
      expect{ post :create, account: account_attributes }.to change{Account.count}.by 1
    end.to change{User.count}.by 1
  end

  it 'renders form for invalid params' do
    post :create, account: { owner_attributes: { first_name: '' } }

    expect(response).to render_template :new
  end

end

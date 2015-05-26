require 'rails_helper'

describe DashboardsController, type: :controller do
  let(:user) { create(:user) }
  let(:account) { create(:account, owner: user) }

  it 'redirects to sign in user if not signed in' do
    request.host = 'subdomain.getwolfpack.dev'

    get :show

    expect(response).to be_redirect
    expect(response).to redirect_to new_user_session_url(subdomain: 'subdomain')
  end

  describe 'for signed in user' do
    before do
      account
      sign_in user
    end

    it 'renders show template if user is signed in' do
      request.host = "#{account.subdomain}.getwolfpack.dev"
      get :show
      expect(response.status).to be 200
      expect(response).to render_template :show
    end

    it 'redirects to subdomain if subdomain is absend for signed in user' do
      request.host = 'getwolfpack.dev'
      get :show
      expect(response).to redirect_to "http://#{account.subdomain}.getwolfpack.dev/"
    end
  end
end

require 'rails_helper'

describe Authentication::SessionsController, type: :request do
  let(:base_url) { '/authentication/sessions' }

  context 'POST #create' do
    let(:post_request) { post base_url, params: auth_params }

    context 'when user exists with proper login and password' do
      let(:auth_params) { { email: 'test@test.com', password: '123' } }

      let(:user) { User.create(auth_params) }

      before do
        user
      end

      it 'should return json token' do
        post_request

        expect(JSON.parse(response.body)).to eq({ 'token' => user.token })
      end
    end

    context 'when user does not exist with proper login and password' do
      let(:auth_params) { { email: '', password: '' } }

      it 'should return json token' do
        post_request

        aggregate_failures do
          expect(response.body).to eq(' ')
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end
end

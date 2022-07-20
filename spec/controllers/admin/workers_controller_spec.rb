require 'rails_helper'

describe 'Admin::WorkersController' , type: :request do
  let(:base_url) { '/admin/workers' }

  describe 'should require authenticated user' do
    describe 'GET #index' do
      let(:get_request) { get base_url, params: { token: token } }

      context 'user exists' do
        let(:user) { User.create(email: 'test@test.com', password: 121341234) }

        before do
          user
        end

        context 'token fits user token' do
          let(:token) { user.token }

          it 'should return status ok' do
            get_request

            expect(response).to have_http_status(:ok)
          end
        end

        context 'token invalid' do
          let(:token) { 'invalid' }

          it 'should return status unauthorized' do
            get_request

            expect(response).to have_http_status(:unauthorized)
          end
        end
      end
    end
  end
end

require 'rails_helper'

describe Authentication::RegistrationsController, type: :request do
  let(:base_url) { '/authentication/registration' }

  describe 'POST #create' do
    let(:post_request) { post base_url, params: user_params }

    let(:user_params) {
      {
        user: {
          email:    'test@test.com',
          password: '123'
        }
      }
    }

    it 'should create user' do
      expect { post_request }.to change { User.count }.by(1)
    end

    it 'should return user data' do
      post_request

      expect(JSON.parse(response.body)).to eq({ 'token' => User.last.token })
    end
  end
end

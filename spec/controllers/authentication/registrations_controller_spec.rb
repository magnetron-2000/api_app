require 'rails_helper'

describe Authentication::RegistrationsController do
  describe 'POST #create' do
    it 'should return ok' do
      expect(post :create).to have_http_status(:ok)
    end
  end
end

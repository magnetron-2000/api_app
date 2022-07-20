require 'rails_helper'

describe 'User' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context '#generate_token' do
    it 'should generate token after user created' do
      user = User.create(email: 'test@test.com', password: '1321')
      expect(user.token).to be_present
    end

    context 'unique token' do
      let(:created_user) { User.create(email: 'test@test.com', password: '1321') }

      it 'should generate unique token' do
        created_user

        user = User.create(email: 'another@test.com', password: '1321')

        aggregate_failures do
          expect(user.token).to be_present
          expect(user.token).to_not eq(created_user.token)
        end
      end
    end
  end
end

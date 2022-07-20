class User < ApplicationRecord
  before_create :generate_token

  def generate_token
    generated_token = SecureRandom.hex(10)

    while User.where(token: generated_token).exists? do
      generated_token = SecureRandom.hex(10)
    end

    self.token = generated_token
  end
end
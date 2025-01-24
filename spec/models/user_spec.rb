require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :clients }
  end

  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :encrypted_password }

    context 'uniqueness' do
      before do 
        @user = User.create(email: 'fake@email.com', password: 'password')
      end

      it 'validates uniqueness of email' do
        duplicate_user = User.new(email: @user.email, password: 'password')

        expect(duplicate_user).to_not be_valid
      end
    end
  end
end

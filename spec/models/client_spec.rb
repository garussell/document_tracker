require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :documents }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :dob }
    it { should validate_presence_of :last_appointment }
    it { should validate_presence_of :next_appointment }
    it { should validate_presence_of :notes }
    it { should validate_presence_of :user_id }
  
    context 'uniqueness' do
      before do
        @user = User.create(email: 'fake@email.com', password: 'password')
        @existing_client = Client.create!(
          name: 'John Doe',
          dob: '01/01/2000',
          last_appointment: '01/01/2022',
          next_appointment: '01/01/2023',
          notes: 'Some notes',
          user_id: @user.id
        )
      end

      it 'validates uniqueness of name and dob' do
        duplicate_client = Client.new(
          name: 'John Doe',
          dob: '01/01/2000',
          last_appointment: '01/01/2022',
          next_appointment: '01/01/2023',
          notes: 'Some notes',
          user_id: @user.id
        )

        expect(duplicate_client).to_not be_valid
      end
    end
  end
end

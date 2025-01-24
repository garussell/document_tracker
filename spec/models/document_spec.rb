require 'rails_helper'

RSpec.describe Document, type: :model do
  describe 'relationships' do
    it { should belong_to :client }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :category }
    it { should validate_presence_of :due_interval }
    it { should validate_presence_of :due_date }
    it { should validate_presence_of :client_id }

    context 'uniqueness' do
      before do
        @client = Client.create(name: 'Fake Client', dob: Date.today, last_appointment: Date.today, next_appointment: Date.today, user_id: 1)
        @document = Document.create(name: 'Fake Document', category: 'Fake Category', due_interval: 1, due_date: Date.today, client_id: @client.id)
      end

      it 'validates uniqueness of name scoped to client_id' do
        duplicate_document = Document.new(name: @document.name, category: 'Fake Category', due_interval: 1, due_date: Date.today, client_id: @client.id)

        expect(duplicate_document).to_not be_valid
      end
    end
  end
end

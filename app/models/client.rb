class Client < ApplicationRecord
  belongs_to :user
  has_many :documents, dependent: :destroy

  validates :name, uniqueness: { scope: :user_id }
  validates_presence_of :name, :dob, :last_appointment, :next_appointment, :notes, :user_id
end

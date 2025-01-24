class Document < ApplicationRecord
  belongs_to :client

  validates_uniqueness_of :name, scope: :client_id
  validates_presence_of :name, :category, :due_interval, :due_date, :client_id
end

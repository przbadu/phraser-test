class Phrase < ApplicationRecord
  # validations
  validates :title, presence: true

  # scopes
  scope :unread, -> { where(status: 'unread') }
  scope :random, -> { order('RANDOM()') }

  def self.reset_all!
    Phrase.update_all(status: 'unread')
  end

  def read_phrase!
    self.update_attribute(:status, 'read')
  end
end

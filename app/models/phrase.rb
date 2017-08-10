class Phrase < ApplicationRecord
  def self.reset_all!
    Phrase.update_all(status: 'unread')
  end

  def read_phrase!
    self.update_attribute(:status, 'read')
  end
end

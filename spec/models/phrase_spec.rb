require 'rails_helper'

RSpec.describe Phrase, type: :model do
  context '#reset_all!' do
    it 'should update all phrases to unread' do
      a = create(:phrase, title: 'first', status: 'read')
      b = create(:phrase, title: 'second', status: 'read')

      described_class.reset_all!
      a.reload
      expect(a.status).to eq('unread')
      b.reload
      expect(b.status).to eq('unread')
    end
  end

  context '#read_phrase!' do
    it 'should read current phrase' do
      a = create(:phrase, title: 'first', status: 'unread')

      a.read_phrase!
      a.reload
      expect(a.status).to eq('read')
    end
  end
end

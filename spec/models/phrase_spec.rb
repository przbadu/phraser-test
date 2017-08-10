require 'rails_helper'

RSpec.describe Phrase, type: :model do
  before do
    @a = create(:phrase, title: 'first', status: 'read')
    @b = create(:phrase, title: 'second', status: 'read')
    @c = create(:phrase, title: 'second', status: 'unread')
  end

  context '#reset_all!' do
    it 'should update all phrases to unread' do
      described_class.reset_all!
      @a.reload
      expect(@a.status).to eq('unread')
      @b.reload
      expect(@b.status).to eq('unread')
    end
  end

  context '#read_phrase!' do
    it 'should read current phrase' do
      @c.read_phrase!
      @c.reload
      expect(@c.status).to eq('read')
    end
  end

  context '#unread' do
    it 'should return all unread threads' do
      expect(described_class.unread).to eq([@c])
    end
  end
end

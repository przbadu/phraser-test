require 'rails_helper'

RSpec.describe Phrase, type: :model do
  context '#reset_all!' do
    it 'should update all phrases to unread' do
      a = create(:phrase, title: 'first', status: 'read')
      b = create(:phrase, title: 'second', status: 'read')

      described_class.reset_all!
      expect(a.status).to eq('unread')
      expect(b.status).to eq('unread')
    end
  end

  context '#read_phrase!' do
    a = create(:phrase, title: 'first', status: 'unread')

    a.read_phrase!
    expect(a.status).to eq('read')
  end
end

require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  context '#index' do
    it 'should display random phrase' do
      a = create(:phrase, title: 'first phrase')
      b = create(:phrase, title: 'first phrase')

      get :index

      expect(response.status).to eq(200)
      expect(assigns(:phrase)).not_to be_nil
    end

    it 'should render index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  context '#show' do
    it 'should get unread random phrase' do
      a = create(:phrase, title: 'first', status: 'unread')
      b = create(:phrase, title: 'second', status: 'read')
      b = create(:phrase, title: 'third', status: 'unread')

      get :show, params: { id: b.id }, xhr: true
      expect(assigns(:phrase)).to eq(a)
    end

    it 'should update current phrase to read' do
      a = create(:phrase, title: 'first', status: 'unread')
      get :show, params: { id: a.id }, xhr: true
      a.reload
      expect(a.status).to eq('read')
    end
  end
end

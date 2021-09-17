# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(ImagesController, type: :controller) do
  before do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  before :all do
    @filepng = Rack::Test::UploadedFile.new('spec/test_files/test-checkmark.png', 'image/png')
    @filejpg = Rack::Test::UploadedFile.new('spec/test_files/test-chair.jpg', 'image/jpeg')
    @filehtml = Rack::Test::UploadedFile.new('spec/test_files/home.html', 'text/html')
  end

  describe 'POST image/index' do
    it 'adds a png image' do
      post :create, params: { 'image' => { 'files' => [@filepng] } }
      expect(response).to(be_successful)
    end

    it 'adds a jpg image' do
      post :create, params: { 'image' => { 'files' => [@filejpg] } }
      expect(response).to(be_successful)
    end

    it 'fails to add a html file' do
      post :create, params: { 'image' => { 'files' => [@filehtml] } }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'adds multiple images' do
      post :create, params: { 'image' => { 'files' => [@filejpg, @filepng] } }
      expect(response).to(be_successful)
    end
  end

  describe 'GET image/index' do
    it 'gives a successful response' do
      get :index
      expect(response).to(be_successful)
    end
  end

  describe 'DESTROY image/destroy' do
    it 'destroys an image' do
      post :create, params: { 'image' => { 'files' => [@filepng] } }
      delete :destroy, params: { id: 1 }
      expect(response).to(be_successful)
    end
  end
end

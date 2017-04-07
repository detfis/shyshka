require 'spec_helper'
require_relative '../../../../apps/web/controllers/words/create'

describe Web::Controllers::Words::Create do
  let(:action) { Web::Controllers::Words::Create.new }
  

  before do
    WordRepository.new.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[word: { name: 'lew', translation: 'lion' }] }

    it 'creates a new word' do
      action.call(params)

      action.word.id.wont_be_nil
      action.word.name.must_equal params[:word][:name]
    end

    it 'redirects the user to the words listing' do
      response = action.call(params)

      response[0].must_equal 302
      response[1]['Location'].must_equal '/'
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[word: {}] }

    it 're-renders the words#new view' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'sets errors attribute accordingly' do
      response = action.call(params)
      response[0].must_equal 422

      action.params.errors[:word][:name].must_equal  ['is missing']
      action.params.errors[:word][:translation].must_equal ['is missing']
    end

  end
end
require 'spec_helper'
require_relative '../../../../apps/web/controllers/words/create'

describe Web::Controllers::Words::Create do
  let(:action) { Web::Controllers::Words::Create.new }
  let(:params) { Hash[word: { name: 'lew', translation: 'lion' }] }

  before do
    WordRepository.new.clear
  end

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
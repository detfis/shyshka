require 'features_helper'

describe 'List words' do
  let(:repository) { WordRepository.new }
  before do
    repository.clear

    repository.create(name: 'pies', translation: 'dog')
    repository.create(name: 'kot', translation: 'cat')
  end  

  it 'displays list of the words' do
    visit '/'

    within '#words' do
      assert page.has_css?('.word', count: 2), 'Expected to find 2 words'
    end
  end
end
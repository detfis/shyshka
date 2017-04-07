require 'features_helper'

describe 'Add a word' do
  before do
    WordRepository.new.clear
  end

  it 'can create a new word' do
    visit '/words/new'

    within 'form#word-form' do
      fill_in 'Name',  with: 'lew'
      fill_in 'Translation', with: 'lion'

      click_button 'Create'
    end

    current_path.must_equal('/')
    assert page.has_content?('All words')
    assert page.has_content?('lion')
  end

  it 'displays list of errors when params contains errors' do
    visit '/words/new'

    within 'form#word-form' do
      click_button 'Create'
    end

    current_path.must_equal('/words')

    assert page.has_content?('There was a problem with your submission')
    assert page.has_content?('Name must be filled')
    assert page.has_content?('Translation must be filled')
  end  
end
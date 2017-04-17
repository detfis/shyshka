require 'features_helper'

describe 'Edit a word' do
  before do
    WordRepository.new.clear
    @word = WordRepository.new.create(name: "lew", translation: "lion")
  end

  it 'can edit a word' do
    visit "/words/#{@word.id}/edit"

    within 'form#word-form' do
      fill_in 'Name',  with: 'lew_2'
      fill_in 'Translation', with: 'lion_2'

      click_button 'Update'
    end

    current_path.must_equal('/')
    assert page.has_content?('All words')
    assert page.has_content?('lion_2')
  end

  it 'displays list of errors when params contains errors' do
    visit "/words/#{@word.id}/edit"

    within 'form#word-form' do
      fill_in 'Name',  with: ''
      fill_in 'Translation', with: ''
      click_button 'Update'
    end

    current_path.must_equal("/words/#{@word.id}")

    assert page.has_content?('There was a problem with your submission')
    assert page.has_content?('Name must be filled')
    assert page.has_content?('Translation must be filled')
  end  
end
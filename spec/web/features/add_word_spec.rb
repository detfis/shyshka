require 'features_helper'

describe 'Add a word' do
  after do
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
    save_and_open_page
    assert page.has_content?('All words')
    assert page.has_content?('lion')
  end
end
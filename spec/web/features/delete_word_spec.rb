require 'features_helper'

describe 'Delete words' do
  before do
    WordRepository.new.clear
    @word = WordRepository.new.create(name: "lew", translation: "lion")
  end  

  it 'deletes the word' do
    visit '/'
    within '.word .actions .delete_word' do
     click_button "Delete"
    end

    current_path.must_equal('/')
    assert page.has_content?('All words')
    assert page.has_content?('There are no words yet.')    
  end
end
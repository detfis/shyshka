require 'features_helper'

describe 'List words' do
  it 'displays list of the words' do
    visit '/'

    within '#words' do
      assert page.has_css?('.word', count: 2), 'Expected to find 2 words'
    end
  end
end
require 'spec_helper'
require_relative '../../../../apps/web/views/words/index'

describe Web::Views::Words::Index do
  let(:exposures) { Hash[words: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/words/index.html.erb') }
  let(:view)      { Web::Views::Words::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #words' do
    view.words.must_equal exposures.fetch(:words)
  end

  describe 'when there are no words' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no words yet.</p>')
    end
  end

  describe 'when there are words' do
    let(:word1)     { Word.new(name: 'pies', translation: 'dog') }
    let(:word2)     { Word.new(name: 'kot', translation: 'cat') }
    let(:exposures) { Hash[words: [word1, word2]] }

    it 'lists them all' do
      rendered.must_include('pies')
      rendered.must_include('kot')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no words yet.</p>')
    end
  end  
end

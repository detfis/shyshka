require 'spec_helper'

describe Word do
  it 'can be initialized with attributes' do
    word = Word.new(name: 'pies', translation: 'dog')
    word.name.must_equal 'pies'
    word.translation.must_equal 'dog'
  end
end

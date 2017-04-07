# require 'spec_helper'
# require_relative '../../../../apps/web/controllers/words/index'

# describe Web::Controllers::Words::Index do
#   let(:action) { Web::Controllers::Words::Index.new }
#   let(:params) { Hash[] }
#   let(:repository) { WordRepository.new }

#   before do
#     repository.clear

#     @word = repository.create(name: 'pies', translation: 'dog')
#   end

#   it 'is successful' do
#     response = action.call(params)
#     response[0].must_equal 200
#   end

#   it 'exposes all words' do
#     action.call(params)
#     action.exposures[:words].must_equal [@word]
#   end
# end
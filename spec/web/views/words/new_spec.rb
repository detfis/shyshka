# require 'spec_helper'
# require_relative '../../../../apps/web/views/words/new'

# class NewWordParams < Hanami::Action::Params
#   params do
#     required(:word).schema do
#       required(:name).filled(:str?)
#       required(:translation).filled(:str?)
#     end
#   end
# end


# describe Web::Views::Words::New do
#   let(:params)    { NewWordParams.new(book: {}) }
#   let(:exposures) { Hash[params: params] }
#   let(:template)  { Hanami::View::Template.new('apps/web/templates/words/new.html.erb') }
#   let(:view)      { Web::Views::Words::New.new(template, exposures) }
#   let(:rendered)  { view.render }

#   it 'displays list of errors when params contains errors' do
#     params.valid? # trigger validations

#     rendered.must_include('There was a problem with your submission')
#     rendered.must_include('Name is missing')
#     rendered.must_include('Translation is missing')
#   end
# end

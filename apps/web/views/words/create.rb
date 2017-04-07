module Web::Views::Words
  class Create
    include Web::View
    include Hanami::Helpers
    template 'words/new'

    def form
      Form.new(:word, '/words')
    end

    def submit_label
      'Create'
    end  
  end
end

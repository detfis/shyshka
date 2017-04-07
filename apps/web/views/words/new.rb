module Web::Views::Words
  class New
    include Web::View
    include Hanami::Helpers

    def form
      Form.new(:word, '/words')
    end

    def submit_label
      'Create'
    end
  end
end

module Web::Views::Words
  class Edit
    include Web::View
    # include Hanami::Helpers

    def form
      Form.new(:word, "/words/#{word.id}", {word: word, examples: word.examples}, {method: :patch})
    end

    def submit_label
      'Update'
    end    
  end
end

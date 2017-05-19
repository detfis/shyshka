module Web::Views::Words
  class New
    include Web::View

    def form
      Form.new(:word, '/words', values: {word: word, examples: word.examples})
    end

    def submit_label
      'Create'
    end
  end
end

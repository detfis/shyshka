module Web::Views::Words
  class Update
    include Web::View
    template 'words/edit'

    def form
      Form.new(:word, "/words/#{word.id}", {word: word}, {method: :patch})
    end

    def submit_label
      'Update'
    end     
  end
end

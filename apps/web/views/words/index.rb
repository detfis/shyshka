module Web::Views::Words
  class Index
    include Web::View   

    def delete_word_form(word)
      form_for :word, routes.destroy_word_path(word.id), method: :delete, class: "delete_word" do
        submit 'Delete'
      end
    end
  end
end

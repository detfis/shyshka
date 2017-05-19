module Web::Controllers::Words
  class Edit
    include Web::Action

    expose :word

    def call(params)
      @word = WordRepository.new.find_with_examples(params[:id])
    end
  end
end

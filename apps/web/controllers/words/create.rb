module Web::Controllers::Words
  class Create
    include Web::Action

    expose :word

    params do
      required(:word).schema do
        required(:name).filled(:str?)
        required(:translation).filled(:str?)
        required(:examples).schema do
          optional(:text).maybe(:str?)
        end
      end
    end

    def call(params)
      if params.valid?
        @word = WordRepository.new.create_with_examples(params[:word])

        redirect_to '/'
      else
        @word = Word.new(params[:word])
        self.status = 422
      end
    end
  end
end

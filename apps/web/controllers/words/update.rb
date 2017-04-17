module Web::Controllers::Words
  class Update
    include Web::Action

    expose :word

    params do
      required(:word).schema do
        required(:name).filled(:str?)
        required(:translation).filled(:str?)
      end
    end

    def call(params)  
      if params.valid?
        @word = WordRepository.new.update(params[:id], params[:word])

        redirect_to '/'
      else
        @word = WordRepository.new.find(params[:id])
        self.status = 422
      end
    end
  end
end

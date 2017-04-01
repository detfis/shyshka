module Web::Controllers::Words
  class Create
    include Web::Action

    expose :word

    def call(params)
      @word = WordRepository.new.create(params[:word])

      redirect_to '/'      
    end
  end
end

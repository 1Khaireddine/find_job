Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  if Rails.env.development? || ENV['MAILING_DELIVERY_METHOD'] == 'letter_opener_web'
    mount LetterOpenerWeb::Engine,
          at: '/letter_opener'
  end
end

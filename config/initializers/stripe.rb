if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_h18KK4nQv16NDpfYslZB9wWv',
    secret_key: 'sk_test_UC387mggmakuOKCMY5xTEHKK'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#RequestForPasswordChange::Application.config.secret_key_base = '2a1e1bc7f4ebf20afbac370b8f212d32476df1696467f0c92c217dfba49f0f8780c3d582ae95daf2a8dbec2be9bfdb1f7496efb4eda08ab23f00ce5e54c9f10d'


require 'securerandom'

def secure_token
    token_file = Rails.root.join('secret')
    if File.exist?(token_file)
        File.read(token_file).chomp
    else
        token = SecureRandom.hex(64)
        File.write(token_file, token)
        token
    end
end

RequestForPasswordChange::Application.config.secret_key_base = secure_token
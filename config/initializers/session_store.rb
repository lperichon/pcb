# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pcb_session',
  :secret      => 'e186d66ff4b63984a40bb1bd28a888b4c1003c67b68569cd53e1324f8ee201a550889a6ce0b6cce05696ea3759a46685dab420e57dd764db885ea1b32ad4de06'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

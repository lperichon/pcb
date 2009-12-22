# Tell the I18n library where to find your translations
I18n.load_path += Dir[ File.join(RAILS_ROOT, 'config', 'locales', '*.{rb,yml}') ]

# Tell the default locale. If this value is not set, "en" is set.
# With this library, this value is used as the lowest priority locale
# (If other locale candidates are not found, this value is used).
I18n.default_locale = "es"
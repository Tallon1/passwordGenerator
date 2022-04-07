# frozen_string_literal: true

require_relative "passwordGenerator/version"

module PasswordGenerator
  # Used to generate a random password + conditions
  
  # Available Arguments:
  # +length+: The length of the password to be generated. Default value = 10.
  # +options+: Various options to generate password
  
  # +:skip_lower_case+:                 Skip lower case when true
  # +:skip_upper_case+:                 Skip upper case when true
  # +:skip_numbers+:                    Skip numbers when true
  # +:skip_symbols+:                    Skip symbols when true
  # +:skip_url_unsafe+:                 Skip characters used in URLs when true
  # +:include_unfrieldly_chars+:   Include visually mistakable characters when true
  
  def self.generate(length = 10, options = {})
    chars = []
    
    chars += ("a".."z").to_a unless options[:skip_lower_case]
    chars += ("A".."Z").to_a unless options[:skip_upper_case]
    chars += ("0".."9").to_a unless options[:skip_numbers]
    chars += %w(! @ # $ % ^ & \( \) { } [ ] - _ < > ?) unless options[:skip_symbols]
    
    # Skip characters used in URLs
    chars -= %w($ & + , / : \; = ? @ < > # % { } | ^ ~ [ ] `) if options[:skip_url_unsafe]

    # Skip visually mistakable characters
    chars -= %w(i I o O 0 1 l !) unless options[:include_unfrieldly_chars]

    (1..length).collect{chars[rand(chars.size)]}.join
  end
end
def extract_urls(text)
    pattern = /\b(?:http|https|ftp):\/\/w{0,3}\.?\w*\.(?:com|org|net)\/?(?:[^\.| ]+)?/
    match = text.scan(pattern)

    match.each do |match|
        puts match
    end
end

sample_text = "Visit our site at http://www.example.org for more information. Check out our search page at https://example.com/search?q=ruby+regex. Don’t forget to ftp our resources at ftp://example.com/resources."

extract_urls(sample_text)

'''
expected output:
http://www.example.org
https://example.com/search?q=ruby+regex
ftp://example.com/resources
'''

class Article < ActiveRecord::Base

    def url
      "http://sportky.topky.sk/c/#{id_article}/"
    end

    def self.parse_from_sportky(html)
      doc = Nokogiri::HTML.parse(html)

      doc.search('article').map do |div|

        anchor = div.search('a').first

         Article.create!(
            id_article: anchor[:href][/\/(\d+)\//, 1].to_i,
            title: div.search('h2 a').text.gsub(/[\s]+/, ' ').strip,
            perex: div.search('p').text.gsub(/[\s]+/, ' ').strip
        )
      end
    end

end

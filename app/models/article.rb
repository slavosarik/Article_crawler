class Article < ActiveRecord::Base

    def self.parse_from_aktuality(html)
      doc = Nokogiri::HTML.parse(html)

      doc.search('.item-top .col-text').map do |div|
        anchor = div.search('h2 a').first
        Article.create!(
            id_article: anchor[:href][/\/(\d+)\//, 1].to_i,
            title: anchor.text,
            perex: div.search('p').text
        )
      end
    end

end

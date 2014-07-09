class Article < ActiveRecord::Base

    def self.parse_from_aktuality(html)
      doc = Nokogiri::HTML.parse(html)

      doc.search('.article-info-bottom').map do |div|
        anchor = div.search('a').first
        Article.create!(
            id_article: anchor[:href][/\/(\d+)\//, 1].to_i,
            title: anchor.search('.article-title').first.text.gsub(/[\s]+/,' ').strip,      #gsub(/[\t,\n]/, ''),
            perex: div.search('.article-introtext').text
        )
      end
    end

end

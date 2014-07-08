require 'rails_helper'

RSpec.describe Article, :type => :model do
  it 'parses articles' do
    html = File.read(File.dirname(__FILE__) + '/fixtures/football.html', encoding: 'UTF-8')

    Article.parse_from_aktuality(html)

    #expect(Article.count).not_to eq(0)

    article = Article.first
    puts "ahahaha"

    expect(article.title).to eq('Fico ustúpil opozícii, vývoz vody chce stopnúť v Ústave')
    #expect(article.perex).to eq('Opozícia dostala ponuku hlasovať za ďalšiu zmenu Ústavy.')
    #expect(article.sme_id).to eq(7273950)
  end
end
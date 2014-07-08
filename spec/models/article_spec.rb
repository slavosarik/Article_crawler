require 'rails_helper'

RSpec.describe Article, :type => :model do
  it 'parses articles' do
    html = File.read(File.dirname(__FILE__) + '/fixtures/football.html', encoding: 'UTF-8')

    Article.parse_from_aktuality(html)

    expect(Article.count).not_to eq(0)

    article = Article.first

    #puts article.title

    expect(article.title).to eq('Brazílsky obranca Dodo posilnil Inter Miláno')
    #expect(article.perex).to eq('')
    expect(article.id_article).to eq(170733)
  end
end
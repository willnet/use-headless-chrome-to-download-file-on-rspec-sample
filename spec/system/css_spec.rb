require 'rails_helper'

RSpec.describe 'css download', type: :system do
  it 'works' do
    visit root_path
    click_on 'css'
    expect(download_content).to eq "hoge,fuga\n"
  end
end

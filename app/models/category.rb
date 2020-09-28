class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '旅行' },
    { id: 3, name: 'ゲーム・漫画' },
    { id: 4, name: 'アニメ' },
    { id: 5, name: '映画' },
    { id: 6, name: 'プログラミング' },
    { id: 7, name: 'アイドル' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: 'グルメ' },
    { id: 10, name: 'その他' }
  ]
end

# 目的

Laravel で開発を始める時の手助けになるような構成をほぼコピペで作れる。

# 要件

* 基本的に Docker コンテナ上で動かす
* ソースの編集はローカルで行える
* DB 環境はあえてレプリ遅延を起こす
* 用意するコンテナは以下
    * PHP 動作環境
    * Master DB
    * Slave DB

## 今後やるかも

* ディレクトリ構造についての言及やリファクタ
* Debugger の設定
* 言語・FW依存部分を分離
* ECS や k8s を意識した作り

# 使い方

1. リポジトリ内のファイルを取得し、適宜必要な環境へコピー
    * 以後、各種パスはこのリポジトリのルートディレクトリからの相対パスとする 
1. cd docker
1. docker-compose up
1. docker-compose exec php bash
1. laravel new
1. http://localhost へアクセスして動作確認

# お願い

基本的に自分が使う時に都度その時の状況に合わせてアップデート予定です。
もし古くなっていたり、情報・状態に間違いがありましたらご指摘・プルリク頂けると幸いです。

# 参考にさせて頂いた公式以外の資料

* [Dockerを使ってLaravel開発環境構築](https://qiita.com/A-Kira/items/1c55ef689c0f91420e81)
* [docker-composeでMaster/Slave構成のMySQLを手に入れる](https://qiita.com/takyam/items/f13bc4a1db0433ffb958)
* [docker-compose で MySQL レプリケーション環境をサクッと用意する](https://ngyuki.hatenablog.com/entry/2019/02/18/103036)

上記まとめてくださった皆様。
ありがとうございます。

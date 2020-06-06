# レポジトリの用途

PowerShellとWinSCPを使ってFTP先のサーバにファイルを送る

# 使い方

## リモート接続先情報の追加

`$sessionOptions`内の`Password`、`UserName`、`HostName`にそれぞれ情報を記述する。

## アップロード対象の定義

- `lists.txt`にアップロード対象ファイル・フォルダを記述する。
- フォルダの場合、最後のスラッシュの有無は問わない。
- ファイル・フォルダは相対パスで記述する。

※リモート先にすでに存在しているファイルは、上書きされる。



## アップロード先フォルダの追加

`$remotePath`にリモート接続先のアップロード先フォルダを定義する。  
最後をスラッシュにしていないとエラーが起きる。

## ※スクリプトの置き場所に関して

アップロード対象ファイル群のホームディレクトリにスクリプトを置くこと。  
例：アップロード対象ファイルが`~/home/user/public_html`配下にあるなら、スクリプトは`~/home/user/public_html`直下に置く。


# 参考URL

- [Recursively move files in directory tree to/from SFTP/FTP server while preserving source directory structure :: WinSCP](https://winscp.net/eng/docs/library_example_moves_files_keeping_directory_structure#upload_powershell)

ディレクトリ構造を維持してファイルをアップするのに役立つと思ったのですが、`Session.PutFiles`メソッドを使うだけで、指定したファイルのみならず、パスに含まれるサブフォルダまで作成してくれました。

- [PowerShellメモ　パス関連操作 - Qiita](https://qiita.com/Kosen-amai/items/c7669e711d6b5743a840)

親ディレクトリの取得のために参考にしました。

# スクリプト作成の経緯

- [Uploading a list of files :: WinSCP](https://winscp.net/eng/docs/script_upload_file_list)

今回作成したスクリプトでやりたかったことの土台はこれです。ただし、`Session.PutFiles`メソッドに指定するパスはリモートパス以外は絶対パスじゃないといけません。（WinSCPの実行ファイルがある場所がルートディレクトリになっているため）  
なので、今回作成したスクリプトでは、スクリプトを置いた場所を起点に、アップロードしたいファイルを相対パスで指定しても問題無いようにしました。

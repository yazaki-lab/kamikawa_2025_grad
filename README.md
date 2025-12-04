# Yazaki Lab 卒業論文テンプレート

電気通信大学 矢崎研究室の卒業論文用LaTeXテンプレートです。

## 使い方

### 1. リポジトリのクローン

```bash
git clone <このリポジトリのURL>
cd <リポジトリ名>
```

### 2. 必要な情報の編集

`thesis.tex`の以下の部分を編集してください：

- 年度（令和XX年度）
- 論文タイトル
- 学籍番号
- 氏名
- 提出日

### 3. 各セクションの編集

`sections/`フォルダ内の各ファイルを編集します：

- `1-abstract.tex`: 概要
- `2-introduction.tex`: はじめに
- `3-background.tex`: 背景知識
- `4-suggest.tex`: 提案手法
- `5-evaluation.tex`: 評価
- `7-final.tex`: おわりに
- `8-appendix.tex`: 付録

### 4. 参考文献の編集

`export.bib`に参考文献を追加します。

### 5. 図の追加

`fig/`フォルダに図を配置し、LaTeX文書内で参照します。

## ビルド方法

### latexmkを使う場合（推奨）

```bash
make
```

または

```bash
latexmk -f latexmkrc thesis.tex
```

### 自動ビルド（watchモード）

ファイルの変更を監視して自動でビルドします：

```bash
make watch
```

### bibtexの反映

参考文献を更新した場合：

```bash
platex thesis.tex
pbibtex thesis
platex thesis.tex
platex thesis.tex
```

または`make`コマンドで自動的に反映されます。

### クリーンアップ

生成されたファイルを削除：

```bash
make clean
```

## GitHub Actions（自動ビルド・CI）について

このテンプレートには、GitHub Actionsを使った自動ビルド設定が含まれています。

### 仕組み

`.github/workflows/build.yaml`に定義されているワークフローが、以下の条件で自動実行されます：

- **トリガー**: `main`ブランチへのpush
- **対象ファイル**:
  - `thesis.tex`
  - `sections/*`
  - `export.bib`
  - `.github/workflows/build.yaml`

### 実行内容

1. **環境準備**: TexLive環境（`aruneko/texlive`コンテナ）を使用
2. **ビルド**: `latexmk thesis.tex`でPDFを自動生成
3. **リリース作成**: 生成されたPDFを自動的にGitHub Releasesに公開

### リリース形式

- **タグ名**: `%Y%m%d%H%M`形式のタイムスタンプ
  - 例: `202401011530` = 2024年1月1日 15:30にビルド
- **添付ファイル**: `thesis.pdf`

### 使い方

論文を更新したら：

```bash
git add .
git commit -m "論文を更新"
git push origin main
```

数分後、GitHub の Releases ページに最新のPDFが自動的に公開されます。

### 注意事項

- GitHub Actionsは無料枠がありますが、使いすぎに注意してください
- プライベートリポジトリの場合、月2000分まで無料です
- ビルドに失敗した場合は、Actionsタブでログを確認できます

## ファイル構成

```
.
├── thesis.tex              # メインファイル
├── sections/               # 各章のファイル
│   ├── 1-abstract.tex
│   ├── 2-introduction.tex
│   ├── 3-background.tex
│   ├── 4-suggest.tex
│   ├── 5-evaluation.tex
│   ├── 7-final.tex
│   └── 8-appendix.tex
├── fig/                    # 図を格納するフォルダ
├── export.bib              # 参考文献データベース
├── Makefile                # ビルド設定
├── latexmkrc               # latexmk設定
└── README.md               # このファイル
```

## 備考

- フォントサイズや用紙設定は`thesis.tex`の冒頭で設定されています
- 情報処理学会のスタイルファイル（`ipsjunsrt.bst`など）を使用しています
- SkimやevinceなどのPDFビューアーでプレビューできます

# 図の格納フォルダ

このフォルダには、論文で使用する図（PDF、PNG、JPGなど）を格納してください。

## 使い方

1. 図ファイルをこのフォルダに配置
2. LaTeX文書内で以下のように参照

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[clip,width=10cm]{fig/your-figure.pdf}
  \caption{図のキャプション}
  \label{fig:your-label}
\end{figure}
```

## 注意

- 既存のサンプル図は削除してかまいません
- PDFファイルを推奨します（拡大縮小しても画質が劣化しません）

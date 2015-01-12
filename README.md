# KGXToast

AndroidのToastの様なUIを実現するライブラリです。

## 動作環境

iOS8〜

## 使い方

メッセージ文字列を渡し、表示時間を指定します。

```swift
KGXToast.showToastWithMessage("メッセージ文", duration: ToastDisplayDuration.LengthShort)
```

表示時間は下記より指定

```swift
case .LengthShort:
return 2.0
case .LengthNormal:
return 3.5
case .LengthLong:
return 5.0
case .LengthLongLong:
return 8.0
```

## ライセンス

MITライセンス

## 開発者

[@keygx] (<https://twitter.com/keygx>)

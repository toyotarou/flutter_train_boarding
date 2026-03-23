# flutter_train_boarding

Flutter 製の **乗車履歴管理アプリ**です。電車・バスの乗車記録を管理し、地図上でルートや位置情報を可視化します。

---

## 主な機能

- **乗車履歴の記録・表示**
  - 日付・駅名・運賃・往復区分を記録
  - 年別フィルタリングで過去の履歴を閲覧

- **地図表示（flutter_map + OpenStreetMap）**
  - 乗車記録の駅位置をマーカーで表示
  - 駅間のポリラインルート描画（番号付きポリライン）
  - GPS 位置情報（GeoLoc）のタイムライン表示

- **路線不一致チェック**
  - 記録された駅名と路線データを照合
  - 不一致の記録を一覧表示してデータ整合性を維持

- **バス停情報**
  - バス停の名称・住所・緯度経度を管理
  - 地図上にバス停マーカーを表示

- **重複スポット検出**
  - 同一エリアの重複スポットを検出して整理

---

## 技術スタック

| カテゴリ | ライブラリ / 技術 |
|---|---|
| UI フレームワーク | Flutter (SDK ^3.5.0) |
| 状態管理 | hooks_riverpod, riverpod_annotation |
| コード生成 | freezed, json_serializable, build_runner |
| 地図表示 | flutter_map, latlong2 (OpenStreetMap) |
| HTTP 通信 | http |
| スクロール制御 | scroll_to_index |

---

## データモデル

### TrainBoardingModel
乗車記録の基本データ。

| フィールド | 型 | 説明 |
|---|---|---|
| date | DateTime | 乗車日 |
| station | String | 駅名 |
| price | String | 運賃 |
| oufuku | String | 往復区分 |

### TrainModel
路線・電車情報。

| フィールド | 型 | 説明 |
|---|---|---|
| id | int | ID |
| trainNumber | String | 路線番号 |
| trainName | String | 路線名 |
| companyId | int | 鉄道会社 ID |
| orderNumber | int | 表示順 |
| pickup | int | ピックアップフラグ |
| tokyoTrain | int | 東京路線フラグ |

### StationModel
駅情報。

| フィールド | 型 | 説明 |
|---|---|---|
| id | int | ID |
| trainNumber | String | 路線番号 |
| stationName | String | 駅名 |
| address | String | 住所 |
| lat | double | 緯度 |
| lng | double | 経度 |
| prefecture | int | 都道府県コード |

### GeolocModel
GPS 位置情報ログ。

| フィールド | 型 | 説明 |
|---|---|---|
| id | int | ID |
| year / month / day | int | 日付 |
| time | String | 時刻 |
| latitude / longitude | double | 緯度・経度 |

### BusStopAddressModel
バス停情報。

| フィールド | 型 | 説明 |
|---|---|---|
| id | int | ID |
| name | String | バス停名 |
| address | String | 住所 |
| latitude / longitude | double | 緯度・経度 |

---

## 主要サービス

### NumberedPolylinesService
駅間のポリラインに番号を付与して地図上に描画するサービス。

### RoutePairingService
乗車記録と駅データを照合し、ルートのペアリングを行うサービス。

---

## 画面構成

```
HomeScreen
├── 年別フィルタ（ドロップダウン）
├── 乗車履歴リスト
│   ├── 日付・駅名・運賃表示
│   └── 地図アイコン → TrainBoardingMapAlert
├── GeoLoc タイムライン → GeolocTimeDisplayAlert
├── 路線不一致チェック → NotMatchTrainNameDisplayAlert
└── ポリライン駅情報 → PolylineStationInfoAlert
```

---

## アプリ設定

- **テーマ**: ダークテーマ
- **タイトル**: Train Boarding List
- **対応プラットフォーム**: iOS / Android / Web

---

## セットアップ

```bash
# 依存関係のインストール
flutter pub get

# コード生成（freezed / riverpod_annotation）
dart run build_runner build --delete-conflicting-outputs

# アプリ実行
flutter run
```

---

## API

外部 API（`toyohide.work/BrainLog/api`）から以下のデータを取得します：

- 乗車履歴データ
- 路線・駅データ
- GPS 位置情報ログ
- バス停データ

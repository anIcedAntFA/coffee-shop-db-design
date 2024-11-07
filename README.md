# Coffee Shop

- Link dbdigram: [DBDiagram](https://dbdiagram.io/d/coffee-shop-6715383397a66db9a39ecea2)

## Categories

- Drinks => Coffee => Phin => Cafe den, cafe sua
- Coffee beans => Arabica, Robusta
- Merchandise => Coffee mug

| id     | name         | Description | image | slug | position | parent_id |
| ------ | ------------ | ----------- | ----- | ---- | -------- | --------- |
| cat-1  | Drinks       |             |       |      |          |           |
| cat-2  | Expresso     |             |       |      |          | cat-1     |
| cat-3  | Phin Vietnam |             |       |      |          | cat-1     |
| cat-4  | Coffee beans |             |       |      |          |           |
| cat-5  | Merchandise  |             |       |      |          |           |
| cat-6  | Ingredients  |             |       |      |          |           |
| cat-7  | Container    |             |       |      |          |           |
| cat-8  | Best Seller  |             |       |      |          |           |
| cat-9  | Coldbrew     |             |       |      |          | cat-1     |
| cat-10 | Vietnam      |             |       |      |          |           |
| cat-11 | Robusta      |             |       |      |          | cat-4     |

## Products

| id     | name           | Description | image | slug | is_available_for_sale | rating | sale_count |
| ------ | -------------- | ----------- | ----- | ---- | --------------------- | ------ | ---------- |
| prod-1 | Phin sua da    |             |       |      | 1                     |        |            |
| prod-2 | Americano      |             |       |      | 1                     |        |            |
| prod-3 | Ethiopia       |             |       |      | 1                     |        |            |
| prod-4 | Coffee mug     |             |       |      | 1                     |        |            |
| prod-5 | Dalat Milk     |             |       |      | 0                     |        |            |
| prod-6 | Sugar          |             |       |      | 0                     |        |            |
| prod-7 | Empty bottle   |             |       |      | 0                     |        |            |
| prod-8 | Coldbew cam xa |             |       |      | 1                     |        |            |
| prod-9 | Fine Robusta   |             |       |      | 1                     |        |            |

## Product Categories

| product_id | category_id |
| ---------- | ----------- |
| prod-1     | cat-1       |
| prod-1     | cat-3       |
| prod-1     | cat-8       |
| prod-4     | cat-5       |
| prod-5     | cat-6       |
| prod-6     | cat-6       |
| prod-7     | cat-7       |
| prod-8     | cat-1       |
| prod-8     | cat-9       |
| prod-9     | cat-4       |
| prod-9     | cat-10      |
| prod-9     | cat-11      |

- Phin sua da => Drinks, Phin Vietnam, Best Seller
- Coldbrew cam xa => Drinks, Coldbrew
- Fine Robusta => Vietnam (vung trong), Robusta (giong cafe)
- Coffee Mug => Merchandise
- Dalat milk => Ingredients
- Empty bottle => Container

## Types

| id      | name         | Description |
| ------- | ------------ | ----------- |
| type-1  | Glass-S      |             |
| type-2  | Glass-M      |             |
| type-3  | Glass-L      |             |
| type-4  | Bottle-100ml |             |
| type-5  | Bottle-250ml |             |
| type-6  | Bottle-500ml |             |
| type-7  | Bag-200g     |             |
| type-8  | Bag-500g     |             |
| type-9  | Bag-1000g    |             |
| type-10 | Box-500ml    |             |
| type-11 | Pack-1000g   |             |
| type-12 | Bottle-ml    |             |
| type-13 | Bag-g        |             |
| type-14 | Box-ml       |             |
| type-15 | Pack-g       |             |
| type-16 | Box-item     |             |

## Product Details

| id        | product_id | type_id | roast_levels | price     | slug |
| --------- | ---------- | ------- | ------------ | --------- | ---- |
| detail-1  | prod-1     | type-1  | NULL         | 20000.00  |      |
| detail-2  | prod-1     | type-2  | NULL         | 25000.00  |      |
| detail-3  | prod-1     | type-3  | NULL         | 30000.00  |      |
| detail-4  | prod-8     | type-2  | NULL         | 30000.00  |      |
| detail-5  | prod-8     | type-3  | NULL         | 40000.00  |      |
| detail-6  | prod-8     | type-5  | NULL         | 50000.00  |      |
| detail-7  | prod-8     | type-6  | NULL         | 60000.00  |      |
| detail-8  | prod-8     | type-6  | NULL         | 60000.00  |      |
| detail-9  | prod-8     | type-6  | NULL         | 60000.00  |      |
| detail-10 | prod-8     | type-6  | NULL         | 60000.00  |      |
| detail-11 | prod-9     | type-8  | Medium       | 180000.00 |      |
| detail-12 | prod-9     | type-9  | Medium-Dark  | 330000.00 |      |
| detail-13 | prod-4     | type-16 | NULL         | 80000.00  |      |

- detail-1: phin sua da, ly size M, price VND 25000.
- detail-11: Fine Robusta, bag weight 500g, roast level Medium, price VND 180000.
- detail-13: Coffee mug, 1 box 1 item, price VND 80000.

## Stocks

| id      | product_id | type_id | quantity |
| ------- | ---------- | ------- | -------- |
| stock-1 | prod-8     | type-5  | 50       |
| stock-2 | prod-5     | type-10 | 20       |
| stock-3 | prod-9     | type-9  | 30       |

- stock-1: 50 Coldbrew cam sa bottle 250ml
- stock-2: 20 Dalat milk box 500ml
- stock-3: 30 Fine Robusta bag 1000g

## Notes

- Module category: `categories`
- Module product: `products` and `product_categories`
- Module type: `types`
- Module product-details: `product_details`
- Module stock: `stocks`

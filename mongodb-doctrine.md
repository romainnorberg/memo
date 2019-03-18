# MongoDB

## Examples

### Use `$cond`

Raw query:

```
db.conversion_product.aggregate([
    {
        "$match": {
            "siteId": 64
        },
    },
    {
        "$project":
            {
                "merchantCreatedAt": 1, "siteProductId": 1, "siteId": 1
            }
    },
    {
        "$group": {
            "_id": "$siteProductId",
            "current": {
                "$sum": {
                    "$cond": [
                        { "$lte": ["$merchantCreatedAt", new ISODate("2019-03-17T23:59:59+00:00")] },
                        {
                            "$cond": [
                                { "$gte": ["$merchantCreatedAt", new ISODate("2019-03-10T00:00:00+00:00")] },
                                { "$sum": 1 },
                                0
                            ],
                        },
                        0
                    ],
                }
            },
            "compare": {
                "$sum": {
                    "$cond": [
                        { "$lte": ["$merchantCreatedAt", new ISODate("2019-03-10T00:00:00+00:00")] },
                        {
                            "$cond": [
                                { "$gte": ["$merchantCreatedAt", new ISODate("2019-03-03T00:00:00+00:00")] },
                                { "$sum": 1 },
                                0
                            ],
                        },
                        0
                    ],
                }
            },
            "siteId": {"$last": "$siteId" },
        }
    },
    {
        "$sort":
            { "current": -1 }
    },
    { "$limit": 10 },
    {
        "$lookup": {
            "from": "site_product", "localField": "_id", "foreignField": "_id", "as": "siteProducts"
        }
    },
    {
        "$project":
            {
                "current": 1, "compare": 1, "siteId": 1, "siteProduct": { "$arrayElemAt": ["$siteProducts", 0] }, 
                "perf": {
                     "$cond": [
                        {"$eq": ["$compare", 0]},
                        100,
                        {"$multiply": [{'$divide': [{"$subtract": ["$current", "$compare"]}, "$compare"]}, 100]}
                    ]
                    
                }
            }
    },
    {
        "$project":
            {
                "_id": 0, "id": { "$toString": "$siteProduct._id" }, "current": 1, "compare": 1, "perf": 1, "siteId": 1, "title": "$siteProduct.title", "productId": "$siteProduct.productId", "gtin": "$siteProduct.gtin"
            }
    },

]);
```

Using Doctrine Agg. Builder:

```php
$qb = $this->createAggregationBuilder();

        if (null !== $site) {
            $qb
                ->match()
                ->field('siteId')
                ->equals($site->getId());
        }

        $qb->project()
           ->field('merchantCreatedAt')->expression(1)
           ->field('siteProductId')->expression(1)
           ->field('siteId')->expression(1);

        $qb->group()
           ->field('_id')->expression('$siteProductId')
           ->field('current')->expression(['$sum' => [
                '$cond' => [
                    ['$lte' => ['$merchantCreatedAt', $endDate]],
                    ['$cond' => [ // if
                        ['$gte' => ['$merchantCreatedAt', $startDate]],
                        ['$sum' => 1],
                        0,
                    ],
                    ],
                    0,
                ],
            ],
            ])
           ->field('compare')->expression(['$sum' => [
                '$cond' => [
                    ['$lte' => ['$merchantCreatedAt', $endDate->copy()->subDays('7')]],
                    ['$cond' => [ // if
                        ['$gte' => ['$merchantCreatedAt', $startDate->copy()->subDays('7')]],
                        ['$sum' => 1],
                        0,
                    ],
                    ],
                    0,
                ],
            ],
            ])
           ->field('siteId')->expression(['$last' => '$siteId']);

        $qb->sort('current', -1);
        $qb->limit($limit);

        $qb->lookup('site_product')->localField('_id')->foreignField('_id')->alias('siteProducts');

        $qb->project()
           ->field('current')->expression(1)
           ->field('compare')->expression(1)
           ->field('siteId')->expression(1)
           ->field('siteProduct')->arrayElemAt('$siteProducts', 0)
            ->field('perf')->expression([
                '$cond' => [
                    ['$eq' => ['$compare', 0]],
                    100,
                    ['$multiply'=> [
                        ['$divide' => [
                            ['$subtract' => ['$current', '$compare']],
                            '$compare'
                        ]],
                        100
                    ]]
                ]
            ]);

        $qb->project()
           ->field('_id')->expression(0)
           ->field('id')->expression(['$toString' => '$siteProduct._id'])
           ->field('current')->expression(1)
           ->field('compare')->expression(1)
           ->field('perf')->expression(1)
           ->field('siteId')->expression(1)
           ->field('title')->expression('$siteProduct.title')
           ->field('productId')->expression('$siteProduct.productId')
           ->field('gtin')->expression('$siteProduct.gtin');

```

***


# MongoDB

## :bulb: Tips

### Use `toString` expr to get raw `ObjectId`, aggragation example:

```json
db.site_product.aggregate([ { "$match": { "siteId": 64 } }, { "$lookup": { "from": "conversion_product", "localField": "_id", "foreignField": "siteProductId", "as": "conversions" } }, { "$match": { "conversions.merchantCreatedAt": { "$lte": new ISODate("2019-03-12T23:59:59+00:00"), "$gte": new ISODate("2019-02-10T00:00:00+00:00") } } }, { "$project": { "_id": { "$toString": "$_id" }, "title": 1, "gtin": 1, "siteId": 1, "total_sold": { "$size": "$conversions" } } }, { "$sort": { "total_sold": -1 } }, { "$limit": 10 } ]);
```

## Doctrine/Symfony
- INTRODUCTION À DOCTRINE QUERY BUILDER AVEC MONGODB https://blog.eleven-labs.com/fr/introduction-a-doctrine-query-builder-avec-mongodb/

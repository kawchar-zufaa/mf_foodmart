// // To parse this JSON data, do
// //
// //     final catWiseProductModel = catWiseProductModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<CatWiseProductModel> catWiseProductModelFromJson(String str) => List<CatWiseProductModel>.from(json.decode(str).map((x) => CatWiseProductModel.fromJson(x)));
//
// String catWiseProductModelToJson(List<CatWiseProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class CatWiseProductModel {
//   CatWiseProductModel({
//     required this.id,
//     required this.name,
//     required this.slug,
//     required this.permalink,
//     required this.dateCreated,
//     required this.dateCreatedGmt,
//     required this.dateModified,
//     required this.dateModifiedGmt,
//     required this.type,
//     required this.status,
//     required this.featured,
//     required this.catalogVisibility,
//     required this.description,
//     required this.shortDescription,
//     required this.sku,
//     required this.price,
//     required this.regularPrice,
//     required this.salePrice,
//     this.dateOnSaleFrom,
//     this.dateOnSaleFromGmt,
//     this.dateOnSaleTo,
//     this.dateOnSaleToGmt,
//     required this.onSale,
//     required this.purchasable,
//     required this.totalSales,
//     required this.virtual,
//     required this.downloadable,
//     required this.downloads,
//     required this.downloadLimit,
//     required this.downloadExpiry,
//     required this.externalUrl,
//     required this.buttonText,
//     required this.taxStatus,
//     required this.taxClass,
//     required this.manageStock,
//     this.stockQuantity,
//     required this.backorders,
//     required this.backordersAllowed,
//     required this.backordered,
//     this.lowStockAmount,
//     required this.soldIndividually,
//     required this.weight,
//     required this.dimensions,
//     required this.shippingRequired,
//     required this.shippingTaxable,
//     required this.shippingClass,
//     required this.shippingClassId,
//     required this.reviewsAllowed,
//     required this.averageRating,
//     required this.ratingCount,
//     required this.upsellIds,
//     required this.crossSellIds,
//     required this.parentId,
//     required this.purchaseNote,
//     required this.categories,
//     required this.tags,
//     required this.images,
//     required this.attributes,
//     required this.defaultAttributes,
//     required this.variations,
//     required this.groupedProducts,
//     required this.menuOrder,
//     required this.priceHtml,
//     required this.relatedIds,
//     required this.metaData,
//     required this.stockStatus,
//     required this.hasOptions,
//     required this.links,
//   });
//
//   int id;
//   String name;
//   String slug;
//   String permalink;
//   DateTime dateCreated;
//   DateTime dateCreatedGmt;
//   DateTime dateModified;
//   DateTime dateModifiedGmt;
//   Type type;
//   Status status;
//   bool featured;
//   CatalogVisibility catalogVisibility;
//   Description description;
//   String shortDescription;
//   String sku;
//   String price;
//   String regularPrice;
//   String salePrice;
//   dynamic dateOnSaleFrom;
//   dynamic dateOnSaleFromGmt;
//   dynamic dateOnSaleTo;
//   dynamic dateOnSaleToGmt;
//   bool onSale;
//   bool purchasable;
//   int totalSales;
//   bool virtual;
//   bool downloadable;
//   List<dynamic> downloads;
//   int downloadLimit;
//   int downloadExpiry;
//   String externalUrl;
//   String buttonText;
//   TaxStatus taxStatus;
//   TaxClass taxClass;
//   bool manageStock;
//   dynamic stockQuantity;
//   Backorders backorders;
//   bool backordersAllowed;
//   bool backordered;
//   dynamic lowStockAmount;
//   bool soldIndividually;
//   String weight;
//   Dimensions dimensions;
//   bool shippingRequired;
//   bool shippingTaxable;
//   String shippingClass;
//   int shippingClassId;
//   bool reviewsAllowed;
//   String averageRating;
//   int ratingCount;
//   List<dynamic> upsellIds;
//   List<dynamic> crossSellIds;
//   int parentId;
//   String purchaseNote;
//   List<Category> categories;
//   List<Category> tags;
//   List<Image> images;
//   List<dynamic> attributes;
//   List<dynamic> defaultAttributes;
//   List<dynamic> variations;
//   List<dynamic> groupedProducts;
//   int menuOrder;
//   String priceHtml;
//   List<int> relatedIds;
//   List<MetaDatum> metaData;
//   StockStatus stockStatus;
//   bool hasOptions;
//   Links links;
//
//   factory CatWiseProductModel.fromJson(Map<String, dynamic> json) => CatWiseProductModel(
//     id: json["id"],
//     name: json["name"],
//     slug: json["slug"],
//     permalink: json["permalink"],
//     dateCreated: DateTime.parse(json["date_created"]),
//     dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
//     dateModified: DateTime.parse(json["date_modified"]),
//     dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
//     type: typeValues.map[json["type"]]!,
//     status: statusValues.map[json["status"]]!,
//     featured: json["featured"],
//     catalogVisibility: catalogVisibilityValues.map[json["catalog_visibility"]]!,
//     description: descriptionValues.map[json["description"]]!,
//     shortDescription: json["short_description"],
//     sku: json["sku"],
//     price: json["price"],
//     regularPrice: json["regular_price"],
//     salePrice: json["sale_price"],
//     dateOnSaleFrom: json["date_on_sale_from"],
//     dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
//     dateOnSaleTo: json["date_on_sale_to"],
//     dateOnSaleToGmt: json["date_on_sale_to_gmt"],
//     onSale: json["on_sale"],
//     purchasable: json["purchasable"],
//     totalSales: json["total_sales"],
//     virtual: json["virtual"],
//     downloadable: json["downloadable"],
//     downloads: List<dynamic>.from(json["downloads"].map((x) => x)),
//     downloadLimit: json["download_limit"],
//     downloadExpiry: json["download_expiry"],
//     externalUrl: json["external_url"],
//     buttonText: json["button_text"],
//     taxStatus: taxStatusValues.map[json["tax_status"]]!,
//     taxClass: taxClassValues.map[json["tax_class"]]!,
//     manageStock: json["manage_stock"],
//     stockQuantity: json["stock_quantity"],
//     backorders: backordersValues.map[json["backorders"]]!,
//     backordersAllowed: json["backorders_allowed"],
//     backordered: json["backordered"],
//     lowStockAmount: json["low_stock_amount"],
//     soldIndividually: json["sold_individually"],
//     weight: json["weight"],
//     dimensions: Dimensions.fromJson(json["dimensions"]),
//     shippingRequired: json["shipping_required"],
//     shippingTaxable: json["shipping_taxable"],
//     shippingClass: json["shipping_class"],
//     shippingClassId: json["shipping_class_id"],
//     reviewsAllowed: json["reviews_allowed"],
//     averageRating: json["average_rating"],
//     ratingCount: json["rating_count"],
//     upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
//     crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
//     parentId: json["parent_id"],
//     purchaseNote: json["purchase_note"],
//     categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
//     tags: List<Category>.from(json["tags"].map((x) => Category.fromJson(x))),
//     images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//     attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
//     defaultAttributes: List<dynamic>.from(json["default_attributes"].map((x) => x)),
//     variations: List<dynamic>.from(json["variations"].map((x) => x)),
//     groupedProducts: List<dynamic>.from(json["grouped_products"].map((x) => x)),
//     menuOrder: json["menu_order"],
//     priceHtml: json["price_html"],
//     relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
//     metaData: List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
//     stockStatus: stockStatusValues.map[json["stock_status"]]!,
//     hasOptions: json["has_options"],
//     links: Links.fromJson(json["_links"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "slug": slug,
//     "permalink": permalink,
//     "date_created": dateCreated.toIso8601String(),
//     "date_created_gmt": dateCreatedGmt.toIso8601String(),
//     "date_modified": dateModified.toIso8601String(),
//     "date_modified_gmt": dateModifiedGmt.toIso8601String(),
//     "type": typeValues.reverse[type],
//     "status": statusValues.reverse[status],
//     "featured": featured,
//     "catalog_visibility": catalogVisibilityValues.reverse[catalogVisibility],
//     "description": descriptionValues.reverse[description],
//     "short_description": shortDescription,
//     "sku": sku,
//     "price": price,
//     "regular_price": regularPrice,
//     "sale_price": salePrice,
//     "date_on_sale_from": dateOnSaleFrom,
//     "date_on_sale_from_gmt": dateOnSaleFromGmt,
//     "date_on_sale_to": dateOnSaleTo,
//     "date_on_sale_to_gmt": dateOnSaleToGmt,
//     "on_sale": onSale,
//     "purchasable": purchasable,
//     "total_sales": totalSales,
//     "virtual": virtual,
//     "downloadable": downloadable,
//     "downloads": List<dynamic>.from(downloads.map((x) => x)),
//     "download_limit": downloadLimit,
//     "download_expiry": downloadExpiry,
//     "external_url": externalUrl,
//     "button_text": buttonText,
//     "tax_status": taxStatusValues.reverse[taxStatus],
//     "tax_class": taxClassValues.reverse[taxClass],
//     "manage_stock": manageStock,
//     "stock_quantity": stockQuantity,
//     "backorders": backordersValues.reverse[backorders],
//     "backorders_allowed": backordersAllowed,
//     "backordered": backordered,
//     "low_stock_amount": lowStockAmount,
//     "sold_individually": soldIndividually,
//     "weight": weight,
//     "dimensions": dimensions.toJson(),
//     "shipping_required": shippingRequired,
//     "shipping_taxable": shippingTaxable,
//     "shipping_class": shippingClass,
//     "shipping_class_id": shippingClassId,
//     "reviews_allowed": reviewsAllowed,
//     "average_rating": averageRating,
//     "rating_count": ratingCount,
//     "upsell_ids": List<dynamic>.from(upsellIds.map((x) => x)),
//     "cross_sell_ids": List<dynamic>.from(crossSellIds.map((x) => x)),
//     "parent_id": parentId,
//     "purchase_note": purchaseNote,
//     "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
//     "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
//     "images": List<dynamic>.from(images.map((x) => x.toJson())),
//     "attributes": List<dynamic>.from(attributes.map((x) => x)),
//     "default_attributes": List<dynamic>.from(defaultAttributes.map((x) => x)),
//     "variations": List<dynamic>.from(variations.map((x) => x)),
//     "grouped_products": List<dynamic>.from(groupedProducts.map((x) => x)),
//     "menu_order": menuOrder,
//     "price_html": priceHtml,
//     "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
//     "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
//     "stock_status": stockStatusValues.reverse[stockStatus],
//     "has_options": hasOptions,
//     "_links": links.toJson(),
//   };
// }
//
// enum Backorders { NO }
//
// final backordersValues = EnumValues({
//   "no": Backorders.NO
// });
//
// enum CatalogVisibility { VISIBLE }
//
// final catalogVisibilityValues = EnumValues({
//   "visible": CatalogVisibility.VISIBLE
// });
//
// class Category {
//   Category({
//     required this.id,
//     required this.name,
//     required this.slug,
//   });
//
//   int id;
//   Name name;
//   Slug slug;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     id: json["id"],
//     name: nameValues.map[json["name"]]!,
//     slug: slugValues.map[json["slug"]]!,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": nameValues.reverse[name],
//     "slug": slugValues.reverse[slug],
//   };
// }
//
// enum Name { FISH_AND_SEAFOOD, BULAICHA }
//
// final nameValues = EnumValues({
//   "Bulaicha": Name.BULAICHA,
//   "Fish And Seafood": Name.FISH_AND_SEAFOOD
// });
//
// enum Slug { GLOBE_FISHERIES_PRODUCTS, BULAICHA }
//
// final slugValues = EnumValues({
//   "bulaicha": Slug.BULAICHA,
//   "globe-fisheries-products": Slug.GLOBE_FISHERIES_PRODUCTS
// });
//
// enum Description { P_500_G_P, EMPTY, P_11_LBS_BR_100_GM_P }
//
// final descriptionValues = EnumValues({
//   "": Description.EMPTY,
//   "<p>11Lbs<br />\n100gm + -</p>\n": Description.P_11_LBS_BR_100_GM_P,
//   "<p>500g</p>\n": Description.P_500_G_P
// });
//
// class Dimensions {
//   Dimensions({
//     required this.length,
//     required this.width,
//     required this.height,
//   });
//
//   String length;
//   String width;
//   String height;
//
//   factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
//     length: json["length"],
//     width: json["width"],
//     height: json["height"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "length": length,
//     "width": width,
//     "height": height,
//   };
// }
//
// class Image {
//   Image({
//     required this.id,
//     required this.dateCreated,
//     required this.dateCreatedGmt,
//     required this.dateModified,
//     required this.dateModifiedGmt,
//     required this.src,
//     required this.name,
//     required this.alt,
//   });
//
//   int id;
//   DateTime dateCreated;
//   DateTime dateCreatedGmt;
//   DateTime dateModified;
//   DateTime dateModifiedGmt;
//   String src;
//   String name;
//   String alt;
//
//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//     id: json["id"],
//     dateCreated: DateTime.parse(json["date_created"]),
//     dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
//     dateModified: DateTime.parse(json["date_modified"]),
//     dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
//     src: json["src"],
//     name: json["name"],
//     alt: json["alt"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "date_created": dateCreated.toIso8601String(),
//     "date_created_gmt": dateCreatedGmt.toIso8601String(),
//     "date_modified": dateModified.toIso8601String(),
//     "date_modified_gmt": dateModifiedGmt.toIso8601String(),
//     "src": src,
//     "name": name,
//     "alt": alt,
//   };
// }
//
// class Links {
//   Links({
//     required this.self,
//     required this.collection,
//   });
//
//   List<Collection> self;
//   List<Collection> collection;
//
//   factory Links.fromJson(Map<String, dynamic> json) => Links(
//     self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
//     collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "self": List<dynamic>.from(self.map((x) => x.toJson())),
//     "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
//   };
// }
//
// class Collection {
//   Collection({
//     required this.href,
//   });
//
//   String href;
//
//   factory Collection.fromJson(Map<String, dynamic> json) => Collection(
//     href: json["href"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "href": href,
//   };
// }
//
// class MetaDatum {
//   MetaDatum({
//     required this.id,
//     required this.key,
//     required this.value,
//   });
//
//   int id;
//   String key;
//   dynamic value;
//
//   factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
//     id: json["id"],
//     key: json["key"],
//     value: json["value"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "key": key,
//     "value": value,
//   };
// }
//
// class PurpleValue {
//   PurpleValue({
//     required this.name,
//     required this.titleFormat,
//     required this.descriptionEnable,
//     required this.description,
//     required this.type,
//     required this.display,
//     required this.position,
//     required this.required,
//     required this.restrictions,
//     required this.restrictionsType,
//     required this.adjustPrice,
//     required this.priceType,
//     required this.price,
//     required this.min,
//     required this.max,
//     required this.options,
//   });
//
//   String name;
//   String titleFormat;
//   int descriptionEnable;
//   String description;
//   String type;
//   String display;
//   int position;
//   int required;
//   int restrictions;
//   String restrictionsType;
//   int adjustPrice;
//   String priceType;
//   String price;
//   int min;
//   int max;
//   List<Option> options;
//
//   factory PurpleValue.fromJson(Map<String, dynamic> json) => PurpleValue(
//     name: json["name"],
//     titleFormat: json["title_format"],
//     descriptionEnable: json["description_enable"],
//     description: json["description"],
//     type: json["type"],
//     display: json["display"],
//     position: json["position"],
//     required: json["required"],
//     restrictions: json["restrictions"],
//     restrictionsType: json["restrictions_type"],
//     adjustPrice: json["adjust_price"],
//     priceType: json["price_type"],
//     price: json["price"],
//     min: json["min"],
//     max: json["max"],
//     options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "title_format": titleFormat,
//     "description_enable": descriptionEnable,
//     "description": description,
//     "type": type,
//     "display": display,
//     "position": position,
//     "required": required,
//     "restrictions": restrictions,
//     "restrictions_type": restrictionsType,
//     "adjust_price": adjustPrice,
//     "price_type": priceType,
//     "price": price,
//     "min": min,
//     "max": max,
//     "options": List<dynamic>.from(options.map((x) => x.toJson())),
//   };
// }
//
// class Option {
//   Option({
//     required this.label,
//     required this.price,
//     required this.image,
//     required this.priceType,
//   });
//
//   String label;
//   String price;
//   String image;
//   String priceType;
//
//   factory Option.fromJson(Map<String, dynamic> json) => Option(
//     label: json["label"],
//     price: json["price"],
//     image: json["image"],
//     priceType: json["price_type"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "label": label,
//     "price": price,
//     "image": image,
//     "price_type": priceType,
//   };
// }
//
// class FluffyValue {
//   FluffyValue({
//     required this.videoType,
//     required this.uploadVideoId,
//     required this.uploadVideoUrl,
//     required this.youtubeUrl,
//     required this.vimeoUrl,
//     required this.autoplay,
//     required this.videoSize,
//     required this.videoControl,
//     required this.hideGalleryImg,
//     required this.hideInformation,
//     required this.audioStatus,
//   });
//
//   String videoType;
//   String uploadVideoId;
//   String uploadVideoUrl;
//   String youtubeUrl;
//   String vimeoUrl;
//   String autoplay;
//   String videoSize;
//   String videoControl;
//   String hideGalleryImg;
//   String hideInformation;
//   String audioStatus;
//
//   factory FluffyValue.fromJson(Map<String, dynamic> json) => FluffyValue(
//     videoType: json["video_type"],
//     uploadVideoId: json["upload_video_id"],
//     uploadVideoUrl: json["upload_video_url"],
//     youtubeUrl: json["youtube_url"],
//     vimeoUrl: json["vimeo_url"],
//     autoplay: json["autoplay"],
//     videoSize: json["video_size"],
//     videoControl: json["video_control"],
//     hideGalleryImg: json["hide_gallery_img"],
//     hideInformation: json["hide_information"],
//     audioStatus: json["audio_status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "video_type": videoType,
//     "upload_video_id": uploadVideoId,
//     "upload_video_url": uploadVideoUrl,
//     "youtube_url": youtubeUrl,
//     "vimeo_url": vimeoUrl,
//     "autoplay": autoplay,
//     "video_size": videoSize,
//     "video_control": videoControl,
//     "hide_gallery_img": hideGalleryImg,
//     "hide_information": hideInformation,
//     "audio_status": audioStatus,
//   };
// }
//
// enum Status { PUBLISH }
//
// final statusValues = EnumValues({
//   "publish": Status.PUBLISH
// });
//
// enum StockStatus { INSTOCK, OUTOFSTOCK }
//
// final stockStatusValues = EnumValues({
//   "instock": StockStatus.INSTOCK,
//   "outofstock": StockStatus.OUTOFSTOCK
// });
//
// enum TaxClass { EMPTY, ZERO_RATE }
//
// final taxClassValues = EnumValues({
//   "": TaxClass.EMPTY,
//   "zero-rate": TaxClass.ZERO_RATE
// });
//
// enum TaxStatus { NONE, TAXABLE }
//
// final taxStatusValues = EnumValues({
//   "none": TaxStatus.NONE,
//   "taxable": TaxStatus.TAXABLE
// });
//
// enum Type { SIMPLE }
//
// final typeValues = EnumValues({
//   "simple": Type.SIMPLE
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
